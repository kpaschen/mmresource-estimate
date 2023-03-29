--
-- PostgreSQL database dump
--

-- Dumped from database version 14.7 (Ubuntu 14.7-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.7 (Ubuntu 14.7-0ubuntu0.22.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: audits; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.audits (
    id character varying(26) NOT NULL,
    createat bigint,
    userid character varying(26),
    action character varying(512),
    extrainfo character varying(1024),
    ipaddress character varying(64),
    sessionid character varying(26)
);


ALTER TABLE public.audits OWNER TO mattermost;

--
-- Name: bots; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.bots (
    userid character varying(26) NOT NULL,
    description character varying(1024),
    ownerid character varying(190),
    createat bigint,
    updateat bigint,
    deleteat bigint,
    lasticonupdate bigint
);


ALTER TABLE public.bots OWNER TO mattermost;

--
-- Name: channelmemberhistory; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.channelmemberhistory (
    channelid character varying(26) NOT NULL,
    userid character varying(26) NOT NULL,
    jointime bigint NOT NULL,
    leavetime bigint
);


ALTER TABLE public.channelmemberhistory OWNER TO mattermost;

--
-- Name: channelmembers; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.channelmembers (
    channelid character varying(26) NOT NULL,
    userid character varying(26) NOT NULL,
    roles character varying(256),
    lastviewedat bigint,
    msgcount bigint,
    mentioncount bigint,
    notifyprops jsonb,
    lastupdateat bigint,
    schemeuser boolean,
    schemeadmin boolean,
    schemeguest boolean,
    mentioncountroot bigint,
    msgcountroot bigint
);


ALTER TABLE public.channelmembers OWNER TO mattermost;

--
-- Name: channels; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.channels (
    id character varying(26) NOT NULL,
    createat bigint,
    updateat bigint,
    deleteat bigint,
    teamid character varying(26),
    type character varying(1),
    displayname character varying(64),
    name character varying(64),
    header character varying(1024),
    purpose character varying(250),
    lastpostat bigint,
    totalmsgcount bigint,
    extraupdateat bigint,
    creatorid character varying(26),
    schemeid character varying(26),
    groupconstrained boolean,
    shared boolean,
    totalmsgcountroot bigint,
    lastrootpostat bigint DEFAULT '0'::bigint
);


ALTER TABLE public.channels OWNER TO mattermost;

--
-- Name: clusterdiscovery; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.clusterdiscovery (
    id character varying(26) NOT NULL,
    type character varying(64),
    clustername character varying(64),
    hostname character varying(512),
    gossipport integer,
    port integer,
    createat bigint,
    lastpingat bigint
);


ALTER TABLE public.clusterdiscovery OWNER TO mattermost;

--
-- Name: commands; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.commands (
    id character varying(26) NOT NULL,
    token character varying(26),
    createat bigint,
    updateat bigint,
    deleteat bigint,
    creatorid character varying(26),
    teamid character varying(26),
    trigger character varying(128),
    method character varying(1),
    username character varying(64),
    iconurl character varying(1024),
    autocomplete boolean,
    autocompletedesc character varying(1024),
    autocompletehint character varying(1024),
    displayname character varying(64),
    description character varying(128),
    url character varying(1024),
    pluginid character varying(190)
);


ALTER TABLE public.commands OWNER TO mattermost;

--
-- Name: commandwebhooks; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.commandwebhooks (
    id character varying(26) NOT NULL,
    createat bigint,
    commandid character varying(26),
    userid character varying(26),
    channelid character varying(26),
    rootid character varying(26),
    usecount integer
);


ALTER TABLE public.commandwebhooks OWNER TO mattermost;

--
-- Name: compliances; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.compliances (
    id character varying(26) NOT NULL,
    createat bigint,
    userid character varying(26),
    status character varying(64),
    count integer,
    "desc" character varying(512),
    type character varying(64),
    startat bigint,
    endat bigint,
    keywords character varying(512),
    emails character varying(1024)
);


ALTER TABLE public.compliances OWNER TO mattermost;

--
-- Name: db_lock; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.db_lock (
    id character varying(64) NOT NULL,
    expireat bigint
);


ALTER TABLE public.db_lock OWNER TO mattermost;

--
-- Name: db_migrations; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.db_migrations (
    version bigint NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.db_migrations OWNER TO mattermost;

--
-- Name: emoji; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.emoji (
    id character varying(26) NOT NULL,
    createat bigint,
    updateat bigint,
    deleteat bigint,
    creatorid character varying(26),
    name character varying(64)
);


ALTER TABLE public.emoji OWNER TO mattermost;

--
-- Name: fileinfo; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.fileinfo (
    id character varying(26) NOT NULL,
    creatorid character varying(26),
    postid character varying(26),
    createat bigint,
    updateat bigint,
    deleteat bigint,
    path character varying(512),
    thumbnailpath character varying(512),
    previewpath character varying(512),
    name character varying(256),
    extension character varying(64),
    size bigint,
    mimetype character varying(256),
    width integer,
    height integer,
    haspreviewimage boolean,
    minipreview bytea,
    content text,
    remoteid character varying(26),
    archived boolean DEFAULT false NOT NULL
);


ALTER TABLE public.fileinfo OWNER TO mattermost;

--
-- Name: focalboard_blocks; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.focalboard_blocks (
    id character varying(36) NOT NULL,
    insert_at timestamp with time zone DEFAULT now() NOT NULL,
    parent_id character varying(36),
    schema bigint,
    type text,
    title text,
    fields json,
    create_at bigint,
    update_at bigint,
    delete_at bigint,
    root_id character varying(36),
    modified_by character varying(36) NOT NULL,
    workspace_id character varying(36) NOT NULL,
    created_by character varying(36) NOT NULL
);


ALTER TABLE public.focalboard_blocks OWNER TO mattermost;

--
-- Name: focalboard_blocks_history; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.focalboard_blocks_history (
    id character varying(36) NOT NULL,
    insert_at timestamp with time zone DEFAULT now() NOT NULL,
    parent_id character varying(36),
    schema bigint,
    type text,
    title text,
    fields json,
    create_at bigint,
    update_at bigint,
    delete_at bigint,
    root_id character varying(36),
    modified_by character varying(36),
    workspace_id character varying(36),
    created_by character varying(36)
);


ALTER TABLE public.focalboard_blocks_history OWNER TO mattermost;

--
-- Name: focalboard_file_info; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.focalboard_file_info (
    id character varying(26) NOT NULL,
    create_at bigint NOT NULL,
    delete_at bigint,
    name text NOT NULL,
    extension character varying(50) NOT NULL,
    size bigint NOT NULL,
    archived boolean
);


ALTER TABLE public.focalboard_file_info OWNER TO mattermost;

--
-- Name: focalboard_notification_hints; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.focalboard_notification_hints (
    block_type character varying(10),
    block_id character varying(36) NOT NULL,
    workspace_id character varying(36),
    modified_by_id character varying(36),
    create_at bigint,
    notify_at bigint
);


ALTER TABLE public.focalboard_notification_hints OWNER TO mattermost;

--
-- Name: focalboard_schema_migrations; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.focalboard_schema_migrations (
    version bigint NOT NULL,
    dirty boolean NOT NULL
);


ALTER TABLE public.focalboard_schema_migrations OWNER TO mattermost;

--
-- Name: focalboard_sessions; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.focalboard_sessions (
    id character varying(100) NOT NULL,
    token character varying(100),
    user_id character varying(100),
    props json,
    create_at bigint,
    update_at bigint,
    auth_service character varying(20)
);


ALTER TABLE public.focalboard_sessions OWNER TO mattermost;

--
-- Name: focalboard_sharing; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.focalboard_sharing (
    id character varying(36) NOT NULL,
    enabled boolean,
    token character varying(100),
    modified_by character varying(36),
    update_at bigint,
    workspace_id character varying(36)
);


ALTER TABLE public.focalboard_sharing OWNER TO mattermost;

--
-- Name: focalboard_subscriptions; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.focalboard_subscriptions (
    block_type character varying(10),
    block_id character varying(36) NOT NULL,
    workspace_id character varying(36),
    subscriber_type character varying(10),
    subscriber_id character varying(36) NOT NULL,
    notified_at bigint,
    create_at bigint,
    delete_at bigint
);


ALTER TABLE public.focalboard_subscriptions OWNER TO mattermost;

--
-- Name: focalboard_system_settings; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.focalboard_system_settings (
    id character varying(100) NOT NULL,
    value text
);


ALTER TABLE public.focalboard_system_settings OWNER TO mattermost;

--
-- Name: focalboard_users; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.focalboard_users (
    id character varying(100) NOT NULL,
    username character varying(100),
    email character varying(255),
    password character varying(100),
    mfa_secret character varying(100),
    auth_service character varying(20),
    auth_data character varying(255),
    props json,
    create_at bigint,
    update_at bigint,
    delete_at bigint
);


ALTER TABLE public.focalboard_users OWNER TO mattermost;

--
-- Name: focalboard_workspaces; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.focalboard_workspaces (
    id character varying(36) NOT NULL,
    signup_token character varying(100) NOT NULL,
    settings json,
    modified_by character varying(36),
    update_at bigint
);


ALTER TABLE public.focalboard_workspaces OWNER TO mattermost;

--
-- Name: groupchannels; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.groupchannels (
    groupid character varying(26) NOT NULL,
    autoadd boolean,
    schemeadmin boolean,
    createat bigint,
    deleteat bigint,
    updateat bigint,
    channelid character varying(26) NOT NULL
);


ALTER TABLE public.groupchannels OWNER TO mattermost;

--
-- Name: groupmembers; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.groupmembers (
    groupid character varying(26) NOT NULL,
    userid character varying(26) NOT NULL,
    createat bigint,
    deleteat bigint
);


ALTER TABLE public.groupmembers OWNER TO mattermost;

--
-- Name: groupteams; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.groupteams (
    groupid character varying(26) NOT NULL,
    autoadd boolean,
    schemeadmin boolean,
    createat bigint,
    deleteat bigint,
    updateat bigint,
    teamid character varying(26) NOT NULL
);


ALTER TABLE public.groupteams OWNER TO mattermost;

--
-- Name: incomingwebhooks; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.incomingwebhooks (
    id character varying(26) NOT NULL,
    createat bigint,
    updateat bigint,
    deleteat bigint,
    userid character varying(26),
    channelid character varying(26),
    teamid character varying(26),
    displayname character varying(64),
    description character varying(500),
    username character varying(255),
    iconurl character varying(1024),
    channellocked boolean
);


ALTER TABLE public.incomingwebhooks OWNER TO mattermost;

--
-- Name: ir_channelaction; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.ir_channelaction (
    id text NOT NULL,
    channelid character varying(26),
    enabled boolean DEFAULT false,
    deleteat bigint DEFAULT 0 NOT NULL,
    actiontype text NOT NULL,
    triggertype text NOT NULL,
    payload json NOT NULL
);


ALTER TABLE public.ir_channelaction OWNER TO mattermost;

--
-- Name: ir_db_migrations; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.ir_db_migrations (
    version bigint NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.ir_db_migrations OWNER TO mattermost;

--
-- Name: ir_incident; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.ir_incident (
    id text NOT NULL,
    name text NOT NULL,
    description text NOT NULL,
    isactive boolean NOT NULL,
    commanderuserid text NOT NULL,
    teamid text NOT NULL,
    channelid text NOT NULL,
    createat bigint NOT NULL,
    endat bigint DEFAULT 0 NOT NULL,
    deleteat bigint DEFAULT 0 NOT NULL,
    activestage bigint NOT NULL,
    postid text DEFAULT ''::text NOT NULL,
    playbookid text DEFAULT ''::text NOT NULL,
    checklistsjson json NOT NULL,
    activestagetitle text DEFAULT ''::text,
    reminderpostid text,
    broadcastchannelid text DEFAULT ''::text,
    previousreminder bigint DEFAULT 0 NOT NULL,
    remindermessagetemplate text DEFAULT ''::text,
    currentstatus text DEFAULT 'Active'::text NOT NULL,
    reporteruserid text DEFAULT ''::text NOT NULL,
    concatenatedinviteduserids text DEFAULT ''::text,
    defaultcommanderid text DEFAULT ''::text,
    announcementchannelid text DEFAULT ''::text,
    concatenatedwebhookoncreationurls text DEFAULT ''::text,
    concatenatedinvitedgroupids text DEFAULT ''::text,
    retrospective text DEFAULT ''::text,
    messageonjoin text DEFAULT ''::text,
    retrospectivepublishedat bigint DEFAULT 0 NOT NULL,
    retrospectivereminderintervalseconds bigint DEFAULT 0 NOT NULL,
    retrospectivewascanceled boolean DEFAULT false,
    concatenatedwebhookonstatusupdateurls text DEFAULT ''::text,
    laststatusupdateat bigint DEFAULT 0,
    exportchannelonfinishedenabled boolean DEFAULT false NOT NULL,
    categorizechannelenabled boolean DEFAULT false,
    categoryname text DEFAULT ''::text,
    concatenatedbroadcastchannelids text,
    channelidtorootid text DEFAULT ''::text,
    remindertimerdefaultseconds bigint DEFAULT 0 NOT NULL,
    statusupdateenabled boolean DEFAULT true,
    retrospectiveenabled boolean DEFAULT true,
    statusupdatebroadcastchannelsenabled boolean DEFAULT false,
    statusupdatebroadcastwebhooksenabled boolean DEFAULT false
);


ALTER TABLE public.ir_incident OWNER TO mattermost;

--
-- Name: ir_metric; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.ir_metric (
    incidentid text NOT NULL,
    metricconfigid text NOT NULL,
    value bigint,
    published boolean NOT NULL
);


ALTER TABLE public.ir_metric OWNER TO mattermost;

--
-- Name: ir_metricconfig; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.ir_metricconfig (
    id text NOT NULL,
    playbookid text NOT NULL,
    title text NOT NULL,
    description text NOT NULL,
    type text NOT NULL,
    target bigint,
    ordering smallint DEFAULT 0 NOT NULL,
    deleteat bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.ir_metricconfig OWNER TO mattermost;

--
-- Name: ir_playbook; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.ir_playbook (
    id text NOT NULL,
    title text NOT NULL,
    description text NOT NULL,
    teamid text NOT NULL,
    createpublicincident boolean NOT NULL,
    createat bigint NOT NULL,
    deleteat bigint DEFAULT 0 NOT NULL,
    checklistsjson json NOT NULL,
    numstages bigint DEFAULT 0 NOT NULL,
    numsteps bigint DEFAULT 0 NOT NULL,
    broadcastchannelid text DEFAULT ''::text,
    remindermessagetemplate text DEFAULT ''::text,
    remindertimerdefaultseconds bigint DEFAULT 0 NOT NULL,
    concatenatedinviteduserids text DEFAULT ''::text,
    inviteusersenabled boolean DEFAULT false,
    defaultcommanderid text DEFAULT ''::text,
    defaultcommanderenabled boolean DEFAULT false,
    announcementchannelid text DEFAULT ''::text,
    announcementchannelenabled boolean DEFAULT false,
    concatenatedwebhookoncreationurls text DEFAULT ''::text,
    webhookoncreationenabled boolean DEFAULT false,
    concatenatedinvitedgroupids text DEFAULT ''::text,
    messageonjoin text DEFAULT ''::text,
    messageonjoinenabled boolean DEFAULT false,
    retrospectivereminderintervalseconds bigint DEFAULT 0 NOT NULL,
    retrospectivetemplate text,
    concatenatedwebhookonstatusupdateurls text DEFAULT ''::text,
    webhookonstatusupdateenabled boolean DEFAULT false,
    concatenatedsignalanykeywords text DEFAULT ''::text,
    signalanykeywordsenabled boolean DEFAULT false,
    updateat bigint DEFAULT 0 NOT NULL,
    exportchannelonfinishedenabled boolean DEFAULT false NOT NULL,
    categorizechannelenabled boolean DEFAULT false,
    categoryname text DEFAULT ''::text,
    concatenatedbroadcastchannelids text,
    broadcastenabled boolean DEFAULT false,
    runsummarytemplate text DEFAULT ''::text,
    channelnametemplate text DEFAULT ''::text,
    statusupdateenabled boolean DEFAULT true,
    retrospectiveenabled boolean DEFAULT true,
    public boolean DEFAULT false,
    runsummarytemplateenabled boolean DEFAULT true
);


ALTER TABLE public.ir_playbook OWNER TO mattermost;

--
-- Name: ir_playbookautofollow; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.ir_playbookautofollow (
    playbookid text NOT NULL,
    userid text NOT NULL
);


ALTER TABLE public.ir_playbookautofollow OWNER TO mattermost;

--
-- Name: ir_playbookmember; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.ir_playbookmember (
    playbookid text NOT NULL,
    memberid text NOT NULL,
    roles text
);


ALTER TABLE public.ir_playbookmember OWNER TO mattermost;

--
-- Name: ir_run_participants; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.ir_run_participants (
    userid text NOT NULL,
    incidentid text NOT NULL,
    isfollower boolean NOT NULL
);


ALTER TABLE public.ir_run_participants OWNER TO mattermost;

--
-- Name: ir_statusposts; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.ir_statusposts (
    incidentid text NOT NULL,
    postid text NOT NULL
);


ALTER TABLE public.ir_statusposts OWNER TO mattermost;

--
-- Name: ir_system; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.ir_system (
    skey character varying(64) NOT NULL,
    svalue character varying(1024)
);


ALTER TABLE public.ir_system OWNER TO mattermost;

--
-- Name: ir_timelineevent; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.ir_timelineevent (
    id text NOT NULL,
    incidentid text NOT NULL,
    createat bigint NOT NULL,
    deleteat bigint DEFAULT 0 NOT NULL,
    eventat bigint NOT NULL,
    eventtype text DEFAULT ''::text NOT NULL,
    summary text DEFAULT ''::text NOT NULL,
    details text DEFAULT ''::text NOT NULL,
    postid text DEFAULT ''::text NOT NULL,
    subjectuserid text DEFAULT ''::text NOT NULL,
    creatoruserid text DEFAULT ''::text NOT NULL
);


ALTER TABLE public.ir_timelineevent OWNER TO mattermost;

--
-- Name: ir_userinfo; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.ir_userinfo (
    id text NOT NULL,
    lastdailytododmat bigint,
    digestnotificationsettingsjson json
);


ALTER TABLE public.ir_userinfo OWNER TO mattermost;

--
-- Name: ir_viewedchannel; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.ir_viewedchannel (
    channelid text NOT NULL,
    userid text NOT NULL
);


ALTER TABLE public.ir_viewedchannel OWNER TO mattermost;

--
-- Name: jobs; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.jobs (
    id character varying(26) NOT NULL,
    type character varying(32),
    priority bigint,
    createat bigint,
    startat bigint,
    lastactivityat bigint,
    status character varying(32),
    progress bigint,
    data jsonb
);


ALTER TABLE public.jobs OWNER TO mattermost;

--
-- Name: licenses; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.licenses (
    id character varying(26) NOT NULL,
    createat bigint,
    bytes character varying(10000)
);


ALTER TABLE public.licenses OWNER TO mattermost;

--
-- Name: linkmetadata; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.linkmetadata (
    hash bigint NOT NULL,
    url character varying(2048),
    "timestamp" bigint,
    type character varying(16),
    data jsonb
);


ALTER TABLE public.linkmetadata OWNER TO mattermost;

--
-- Name: oauthaccessdata; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.oauthaccessdata (
    token character varying(26) NOT NULL,
    refreshtoken character varying(26),
    redirecturi character varying(256),
    clientid character varying(26),
    userid character varying(26),
    expiresat bigint,
    scope character varying(128)
);


ALTER TABLE public.oauthaccessdata OWNER TO mattermost;

--
-- Name: oauthapps; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.oauthapps (
    id character varying(26) NOT NULL,
    creatorid character varying(26),
    createat bigint,
    updateat bigint,
    clientsecret character varying(128),
    name character varying(64),
    description character varying(512),
    callbackurls character varying(1024),
    homepage character varying(256),
    istrusted boolean,
    iconurl character varying(512),
    mattermostappid character varying(32) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.oauthapps OWNER TO mattermost;

--
-- Name: oauthauthdata; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.oauthauthdata (
    clientid character varying(26),
    userid character varying(26),
    code character varying(128) NOT NULL,
    expiresin integer,
    createat bigint,
    redirecturi character varying(256),
    state character varying(1024),
    scope character varying(128)
);


ALTER TABLE public.oauthauthdata OWNER TO mattermost;

--
-- Name: outgoingwebhooks; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.outgoingwebhooks (
    id character varying(26) NOT NULL,
    token character varying(26),
    createat bigint,
    updateat bigint,
    deleteat bigint,
    creatorid character varying(26),
    channelid character varying(26),
    teamid character varying(26),
    triggerwords character varying(1024),
    callbackurls character varying(1024),
    displayname character varying(64),
    contenttype character varying(128),
    triggerwhen integer,
    username character varying(64),
    iconurl character varying(1024),
    description character varying(500)
);


ALTER TABLE public.outgoingwebhooks OWNER TO mattermost;

--
-- Name: pluginkeyvaluestore; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.pluginkeyvaluestore (
    pluginid character varying(190) NOT NULL,
    pkey character varying(150) NOT NULL,
    pvalue bytea,
    expireat bigint
);


ALTER TABLE public.pluginkeyvaluestore OWNER TO mattermost;

--
-- Name: posts; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.posts (
    id character varying(26) NOT NULL,
    createat bigint,
    updateat bigint,
    deleteat bigint,
    userid character varying(26),
    channelid character varying(26),
    rootid character varying(26),
    originalid character varying(26),
    message character varying(65535),
    type character varying(26),
    props jsonb,
    hashtags character varying(1000),
    filenames character varying(4000),
    fileids character varying(300),
    hasreactions boolean,
    editat bigint,
    ispinned boolean,
    remoteid character varying(26)
);


ALTER TABLE public.posts OWNER TO mattermost;

--
-- Name: preferences; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.preferences (
    userid character varying(26) NOT NULL,
    category character varying(32) NOT NULL,
    name character varying(32) NOT NULL,
    value character varying(2000)
);


ALTER TABLE public.preferences OWNER TO mattermost;

--
-- Name: productnoticeviewstate; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.productnoticeviewstate (
    userid character varying(26) NOT NULL,
    noticeid character varying(26) NOT NULL,
    viewed integer,
    "timestamp" bigint
);


ALTER TABLE public.productnoticeviewstate OWNER TO mattermost;

--
-- Name: publicchannels; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.publicchannels (
    id character varying(26) NOT NULL,
    deleteat bigint,
    teamid character varying(26),
    displayname character varying(64),
    name character varying(64),
    header character varying(1024),
    purpose character varying(250)
);


ALTER TABLE public.publicchannels OWNER TO mattermost;

--
-- Name: reactions; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.reactions (
    userid character varying(26) NOT NULL,
    postid character varying(26) NOT NULL,
    emojiname character varying(64) NOT NULL,
    createat bigint,
    updateat bigint,
    deleteat bigint,
    remoteid character varying(26),
    channelid character varying(26) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.reactions OWNER TO mattermost;

--
-- Name: recentsearches; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.recentsearches (
    userid character(26) NOT NULL,
    searchpointer integer NOT NULL,
    query jsonb,
    createat bigint NOT NULL
);


ALTER TABLE public.recentsearches OWNER TO mattermost;

--
-- Name: remoteclusters; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.remoteclusters (
    remoteid character varying(26) NOT NULL,
    remoteteamid character varying(26),
    name character varying(64) NOT NULL,
    displayname character varying(64),
    siteurl character varying(512),
    createat bigint,
    lastpingat bigint,
    token character varying(26),
    remotetoken character varying(26),
    topics character varying(512),
    creatorid character varying(26)
);


ALTER TABLE public.remoteclusters OWNER TO mattermost;

--
-- Name: retentionpolicies; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.retentionpolicies (
    id character varying(26) NOT NULL,
    displayname character varying(64),
    postduration bigint
);


ALTER TABLE public.retentionpolicies OWNER TO mattermost;

--
-- Name: retentionpolicieschannels; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.retentionpolicieschannels (
    policyid character varying(26),
    channelid character varying(26) NOT NULL
);


ALTER TABLE public.retentionpolicieschannels OWNER TO mattermost;

--
-- Name: retentionpoliciesteams; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.retentionpoliciesteams (
    policyid character varying(26),
    teamid character varying(26) NOT NULL
);


ALTER TABLE public.retentionpoliciesteams OWNER TO mattermost;

--
-- Name: roles; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.roles (
    id character varying(26) NOT NULL,
    name character varying(64),
    displayname character varying(128),
    description character varying(1024),
    createat bigint,
    updateat bigint,
    deleteat bigint,
    permissions text,
    schememanaged boolean,
    builtin boolean
);


ALTER TABLE public.roles OWNER TO mattermost;

--
-- Name: schemes; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.schemes (
    id character varying(26) NOT NULL,
    name character varying(64),
    displayname character varying(128),
    description character varying(1024),
    createat bigint,
    updateat bigint,
    deleteat bigint,
    scope character varying(32),
    defaultteamadminrole character varying(64),
    defaultteamuserrole character varying(64),
    defaultchanneladminrole character varying(64),
    defaultchanneluserrole character varying(64),
    defaultteamguestrole character varying(64),
    defaultchannelguestrole character varying(64),
    defaultplaybookadminrole character varying(64) DEFAULT ''::character varying,
    defaultplaybookmemberrole character varying(64) DEFAULT ''::character varying,
    defaultrunadminrole character varying(64) DEFAULT ''::character varying,
    defaultrunmemberrole character varying(64) DEFAULT ''::character varying
);


ALTER TABLE public.schemes OWNER TO mattermost;

--
-- Name: sessions; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.sessions (
    id character varying(26) NOT NULL,
    token character varying(26),
    createat bigint,
    expiresat bigint,
    lastactivityat bigint,
    userid character varying(26),
    deviceid character varying(512),
    roles character varying(256),
    isoauth boolean,
    props jsonb,
    expirednotify boolean
);


ALTER TABLE public.sessions OWNER TO mattermost;

--
-- Name: sharedchannelattachments; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.sharedchannelattachments (
    id character varying(26) NOT NULL,
    fileid character varying(26),
    remoteid character varying(26),
    createat bigint,
    lastsyncat bigint
);


ALTER TABLE public.sharedchannelattachments OWNER TO mattermost;

--
-- Name: sharedchannelremotes; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.sharedchannelremotes (
    id character varying(26) NOT NULL,
    channelid character varying(26) NOT NULL,
    creatorid character varying(26),
    createat bigint,
    updateat bigint,
    isinviteaccepted boolean,
    isinviteconfirmed boolean,
    remoteid character varying(26),
    lastpostupdateat bigint,
    lastpostid character varying(26)
);


ALTER TABLE public.sharedchannelremotes OWNER TO mattermost;

--
-- Name: sharedchannels; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.sharedchannels (
    channelid character varying(26) NOT NULL,
    teamid character varying(26),
    home boolean,
    readonly boolean,
    sharename character varying(64),
    sharedisplayname character varying(64),
    sharepurpose character varying(250),
    shareheader character varying(1024),
    creatorid character varying(26),
    createat bigint,
    updateat bigint,
    remoteid character varying(26)
);


ALTER TABLE public.sharedchannels OWNER TO mattermost;

--
-- Name: sharedchannelusers; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.sharedchannelusers (
    id character varying(26) NOT NULL,
    userid character varying(26),
    remoteid character varying(26),
    createat bigint,
    lastsyncat bigint,
    channelid character varying(26)
);


ALTER TABLE public.sharedchannelusers OWNER TO mattermost;

--
-- Name: sidebarcategories; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.sidebarcategories (
    id character varying(128) NOT NULL,
    userid character varying(26),
    teamid character varying(26),
    sortorder bigint,
    sorting character varying(64),
    type character varying(64),
    displayname character varying(64),
    muted boolean,
    collapsed boolean
);


ALTER TABLE public.sidebarcategories OWNER TO mattermost;

--
-- Name: sidebarchannels; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.sidebarchannels (
    channelid character varying(26) NOT NULL,
    userid character varying(26) NOT NULL,
    categoryid character varying(128) NOT NULL,
    sortorder bigint
);


ALTER TABLE public.sidebarchannels OWNER TO mattermost;

--
-- Name: status; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.status (
    userid character varying(26) NOT NULL,
    status character varying(32),
    manual boolean,
    lastactivityat bigint,
    dndendtime bigint,
    prevstatus character varying(32)
);


ALTER TABLE public.status OWNER TO mattermost;

--
-- Name: systems; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.systems (
    name character varying(64) NOT NULL,
    value character varying(1024)
);


ALTER TABLE public.systems OWNER TO mattermost;

--
-- Name: teammembers; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.teammembers (
    teamid character varying(26) NOT NULL,
    userid character varying(26) NOT NULL,
    roles character varying(256),
    deleteat bigint,
    schemeuser boolean,
    schemeadmin boolean,
    schemeguest boolean
);


ALTER TABLE public.teammembers OWNER TO mattermost;

--
-- Name: teams; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.teams (
    id character varying(26) NOT NULL,
    createat bigint,
    updateat bigint,
    deleteat bigint,
    displayname character varying(64),
    name character varying(64),
    description character varying(255),
    email character varying(128),
    type character varying(255),
    companyname character varying(64),
    alloweddomains character varying(1000),
    inviteid character varying(32),
    schemeid character varying(26),
    allowopeninvite boolean,
    lastteamiconupdate bigint,
    groupconstrained boolean,
    cloudlimitsarchived boolean DEFAULT false NOT NULL
);


ALTER TABLE public.teams OWNER TO mattermost;

--
-- Name: termsofservice; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.termsofservice (
    id character varying(26) NOT NULL,
    createat bigint,
    userid character varying(26),
    text character varying(65535)
);


ALTER TABLE public.termsofservice OWNER TO mattermost;

--
-- Name: threadmemberships; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.threadmemberships (
    postid character varying(26) NOT NULL,
    userid character varying(26) NOT NULL,
    following boolean,
    lastviewed bigint,
    lastupdated bigint,
    unreadmentions bigint
);


ALTER TABLE public.threadmemberships OWNER TO mattermost;

--
-- Name: threads; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.threads (
    postid character varying(26) NOT NULL,
    replycount bigint,
    lastreplyat bigint,
    participants jsonb,
    channelid character varying(26),
    threaddeleteat bigint
);


ALTER TABLE public.threads OWNER TO mattermost;

--
-- Name: tokens; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.tokens (
    token character varying(64) NOT NULL,
    createat bigint,
    type character varying(64),
    extra character varying(2048)
);


ALTER TABLE public.tokens OWNER TO mattermost;

--
-- Name: uploadsessions; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.uploadsessions (
    id character varying(26) NOT NULL,
    type character varying(32),
    createat bigint,
    userid character varying(26),
    channelid character varying(26),
    filename character varying(256),
    path character varying(512),
    filesize bigint,
    fileoffset bigint,
    remoteid character varying(26),
    reqfileid character varying(26)
);


ALTER TABLE public.uploadsessions OWNER TO mattermost;

--
-- Name: useraccesstokens; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.useraccesstokens (
    id character varying(26) NOT NULL,
    token character varying(26),
    userid character varying(26),
    description character varying(512),
    isactive boolean
);


ALTER TABLE public.useraccesstokens OWNER TO mattermost;

--
-- Name: usergroups; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.usergroups (
    id character varying(26) NOT NULL,
    name character varying(64),
    displayname character varying(128),
    description character varying(1024),
    source character varying(64),
    remoteid character varying(48),
    createat bigint,
    updateat bigint,
    deleteat bigint,
    allowreference boolean
);


ALTER TABLE public.usergroups OWNER TO mattermost;

--
-- Name: users; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.users (
    id character varying(26) NOT NULL,
    createat bigint,
    updateat bigint,
    deleteat bigint,
    username character varying(64),
    password character varying(128),
    authdata character varying(128),
    authservice character varying(32),
    email character varying(128),
    emailverified boolean,
    nickname character varying(64),
    firstname character varying(64),
    lastname character varying(64),
    roles character varying(256),
    allowmarketing boolean,
    props jsonb,
    notifyprops jsonb,
    lastpasswordupdate bigint,
    lastpictureupdate bigint,
    failedattempts integer,
    locale character varying(5),
    mfaactive boolean,
    mfasecret character varying(128),
    "position" character varying(128),
    timezone jsonb,
    remoteid character varying(26)
);


ALTER TABLE public.users OWNER TO mattermost;

--
-- Name: usertermsofservice; Type: TABLE; Schema: public; Owner: mattermost
--

CREATE TABLE public.usertermsofservice (
    userid character varying(26) NOT NULL,
    termsofserviceid character varying(26),
    createat bigint
);


ALTER TABLE public.usertermsofservice OWNER TO mattermost;

--
-- Data for Name: audits; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.audits (id, createat, userid, action, extrainfo, ipaddress, sessionid) FROM stdin;
8wnghxbzaidf8newutosn74jao	1679987348738		/api/v4/users/login	attempt - login_id=testuser-1@example.com	127.0.0.1	
1953b5otk38pjdgtepxthisn1o	1679987348755		/api/v4/users/login	failure - login_id=testuser-1@example.com	127.0.0.1	
rr8cpc4mmjyn5dtmw1593d5dfe	1679987348775		/api/v4/users/login	attempt - login_id=x@y.com	127.0.0.1	
dxcux9z8b7n7me49pwzho6ajuy	1679987348779		/api/v4/users/login	failure - login_id=x@y.com	127.0.0.1	
qmui4w7qp3dw8rdfpr3r5di3oy	1679987543459	fe4jgsubnidkirfqq8ym8i4ykw	/api/v4/users/login	attempt - login_id=	127.0.0.1	
kq4wyzor1i83xpxjh6qc7k5jsw	1679987543552	fe4jgsubnidkirfqq8ym8i4ykw	/api/v4/users/login	authenticated	127.0.0.1	
eu3kz96hktnwfkfu6ix4yih3rw	1679987543558	fe4jgsubnidkirfqq8ym8i4ykw	/api/v4/users/login	success session_user=fe4jgsubnidkirfqq8ym8i4ykw	127.0.0.1	6qi5d5ra9iybtd3mb3dtc17cor
d33k48aftbf5pcirxgdxtgbg3r	1679987543859	fe4jgsubnidkirfqq8ym8i4ykw	/api/v4/users/me/patch		127.0.0.1	6qi5d5ra9iybtd3mb3dtc17cor
\.


--
-- Data for Name: bots; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.bots (userid, description, ownerid, createat, updateat, deleteat, lasticonupdate) FROM stdin;
h9ibc58bdi8sfpfoq8sqgdxxpr	Feedbackbot collects user feedback to improve Mattermost. [Learn more](https://mattermost.com/pl/default-nps).	com.mattermost.nps	1679987083924	1679987083924	0	0
z73x73z94tde3eu4r7qj8gc7rr	A bot account created by the channel export plugin.	com.mattermost.plugin-channel-export	1679987084352	1679987084352	0	0
erbyeb5k43rwmmfg4tk75qx5rc	Mattermost Apps Registry and API proxy.	com.mattermost.apps	1679987086367	1679987086367	0	0
nwxzsy7jxfg6ibgkze6aoqdgpw	Playbooks bot.	playbooks	1679987087761	1679987087761	0	0
86b7ctpk1ign8qscr3fs7z13ty	Created by Boards plugin.	focalboard	1679987088487	1679987088487	0	0
\.


--
-- Data for Name: channelmemberhistory; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.channelmemberhistory (channelid, userid, jointime, leavetime) FROM stdin;
\.


--
-- Data for Name: channelmembers; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.channelmembers (channelid, userid, roles, lastviewedat, msgcount, mentioncount, notifyprops, lastupdateat, schemeuser, schemeadmin, schemeguest, mentioncountroot, msgcountroot) FROM stdin;
\.


--
-- Data for Name: channels; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.channels (id, createat, updateat, deleteat, teamid, type, displayname, name, header, purpose, lastpostat, totalmsgcount, extraupdateat, creatorid, schemeid, groupconstrained, shared, totalmsgcountroot, lastrootpostat) FROM stdin;
\.


--
-- Data for Name: clusterdiscovery; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.clusterdiscovery (id, type, clustername, hostname, gossipport, port, createat, lastpingat) FROM stdin;
\.


--
-- Data for Name: commands; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.commands (id, token, createat, updateat, deleteat, creatorid, teamid, trigger, method, username, iconurl, autocomplete, autocompletedesc, autocompletehint, displayname, description, url, pluginid) FROM stdin;
\.


--
-- Data for Name: commandwebhooks; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.commandwebhooks (id, createat, commandid, userid, channelid, rootid, usecount) FROM stdin;
\.


--
-- Data for Name: compliances; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.compliances (id, createat, userid, status, count, "desc", type, startat, endat, keywords, emails) FROM stdin;
\.


--
-- Data for Name: db_lock; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.db_lock (id, expireat) FROM stdin;
\.


--
-- Data for Name: db_migrations; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.db_migrations (version, name) FROM stdin;
1	create_teams
2	create_team_members
3	create_cluster_discovery
4	create_command_webhooks
5	create_compliances
6	create_emojis
7	create_user_groups
8	create_group_members
9	create_group_teams
10	create_group_channels
11	create_link_metadata
12	create_commands
13	create_incoming_webhooks
14	create_outgoing_webhooks
15	create_systems
16	create_reactions
17	create_roles
18	create_schemes
19	create_licenses
20	create_posts
21	create_product_notice_view_state
22	create_sessions
23	create_terms_of_service
24	create_audits
25	create_oauth_access_data
26	create_preferences
27	create_status
28	create_tokens
29	create_bots
30	create_user_access_tokens
31	create_remote_clusters
32	create_sharedchannels
33	create_sidebar_channels
34	create_oauthauthdata
35	create_sharedchannelattachments
36	create_sharedchannelusers
37	create_sharedchannelremotes
38	create_jobs
39	create_channel_member_history
40	create_sidebar_categories
41	create_upload_sessions
42	create_threads
43	thread_memberships
44	create_user_terms_of_service
45	create_plugin_key_value_store
46	create_users
47	create_file_info
48	create_oauth_apps
49	create_channels
50	create_channelmembers
51	create_msg_root_count
52	create_public_channels
53	create_retention_policies
54	create_crt_channelmembership_count
55	create_crt_thread_count_and_unreads
56	upgrade_channels_v6.0
57	upgrade_command_webhooks_v6.0
58	upgrade_channelmembers_v6.0
59	upgrade_users_v6.0
60	upgrade_jobs_v6.0
61	upgrade_link_metadata_v6.0
62	upgrade_sessions_v6.0
63	upgrade_threads_v6.0
64	upgrade_status_v6.0
65	upgrade_groupchannels_v6.0
66	upgrade_posts_v6.0
67	upgrade_channelmembers_v6.1
68	upgrade_teammembers_v6.1
69	upgrade_jobs_v6.1
70	upgrade_cte_v6.1
71	upgrade_sessions_v6.1
72	upgrade_schemes_v6.3
73	upgrade_plugin_key_value_store_v6.3
74	upgrade_users_v6.3
75	alter_upload_sessions_index
76	upgrade_lastrootpostat
77	upgrade_users_v6.5
78	create_oauth_mattermost_app_id
79	usergroups_displayname_index
80	posts_createat_id
81	threads_deleteat
82	upgrade_oauth_mattermost_app_id
83	threads_threaddeleteat
84	recent_searches
85	fileinfo_add_archived_column
86	add_cloud_limits_archived
87	sidebar_categories_index
88	remaining_migrations
89	add-channelid-to-reaction
\.


--
-- Data for Name: emoji; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.emoji (id, createat, updateat, deleteat, creatorid, name) FROM stdin;
\.


--
-- Data for Name: fileinfo; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.fileinfo (id, creatorid, postid, createat, updateat, deleteat, path, thumbnailpath, previewpath, name, extension, size, mimetype, width, height, haspreviewimage, minipreview, content, remoteid, archived) FROM stdin;
\.


--
-- Data for Name: focalboard_blocks; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.focalboard_blocks (id, insert_at, parent_id, schema, type, title, fields, create_at, update_at, delete_at, root_id, modified_by, workspace_id, created_by) FROM stdin;
bdw6esspakt8mjbsftshygmfiir	2023-03-28 07:04:48.503744+00		1	board	Meeting Agenda 	{"cardProperties":[{"id":"d777ba3b-8728-40d1-87a6-59406bbbbfb0","name":"Status","options":[{"color":"propColorPink","id":"34eb9c25-d5bf-49d9-859e-f74f4e0030e7","value":"To Discuss 💬"},{"color":"propColorYellow","id":"d37a61f4-f332-4db9-8b2d-5e0a91aa20ed","value":"Revisit Later ⏳"},{"color":"propColorGreen","id":"dabadd9b-adf1-4d9f-8702-805ac6cef602","value":"Done / Archived 📦"}],"type":"select"},{"id":"4cf1568d-530f-4028-8ffd-bdc65249187e","name":"Priority","options":[{"color":"propColorRed","id":"8b05c83e-a44a-4d04-831e-97f01d8e2003","value":"1. High"},{"color":"propColorYellow","id":"b1abafbf-a038-4a19-8b68-56e0fd2319f7","value":"2. Medium"},{"color":"propColorGray","id":"2491ffaa-eb55-417b-8aff-4bd7d4136613","value":"3. Low"}],"type":"select"},{"id":"aw4w63xhet79y9gueqzzeiifdoe","name":"Created by","options":[],"type":"createdBy"},{"id":"a6ux19353xcwfqg9k1inqg5sg4w","name":"Created time","options":[],"type":"createdTime"}],"description":"Use this template for recurring meeting agendas, like team meetings and 1:1's. To use this board:\\n* Participants queue new items to discuss under \\"To Discuss\\"\\n* Go through items during the meeting\\n* Move items to Done or Revisit Later as needed","icon":"🍩","isTemplate":true,"showDescription":true,"templateVer":4,"trackingTemplateId":"54fcf9c610f0ac5e4c522c0657c90602"}	1679987088506	1679987088506	0	bdw6esspakt8mjbsftshygmfiir	system	0	system
cc9qypbmxhirypk55n55gdsgbgw	2023-03-28 07:04:48.511231+00	bdw6esspakt8mjbsftshygmfiir	1	card	Team Schedule	{"contentOrder":["a8uz114ebbjg3djyhtoo6krzzea","7153484teg38yuquwizu5b9enie","a7g3xuoxwijbajxtzi5o9n8zj4w","7a7poh44cpbg1frfky8mp1n4n4e","7aau9uhe5tfg6jnctfxmnicejjo","7iw8x53xgmf8dxmemja9ocmx65h"],"icon":"⏰","isTemplate":false,"properties":{"4cf1568d-530f-4028-8ffd-bdc65249187e":"8b05c83e-a44a-4d04-831e-97f01d8e2003","d777ba3b-8728-40d1-87a6-59406bbbbfb0":"34eb9c25-d5bf-49d9-859e-f74f4e0030e7"}}	1679987088515	1679987088515	0	bdw6esspakt8mjbsftshygmfiir	system	0	system
cozgjgqgdnjf6uyt48qxuichnac	2023-03-28 07:04:48.522211+00	bdw6esspakt8mjbsftshygmfiir	1	card	Video production	{"contentOrder":["arkznzpaw83d6d8eeqqzokag8uh","7pfrfz15am7y7fbfndi5rj44zko","au1ysitdzcir8idkxj5qe5qxxyo","71tpu6qo34fgt7xkewyuwzfmdmc","7pozhzthdrt8kpeyi3qi67fmhuo","7qb1us9k3y7dr7nywu4ssn6z4hh"],"icon":"📹","isTemplate":false,"properties":{"4cf1568d-530f-4028-8ffd-bdc65249187e":"b1abafbf-a038-4a19-8b68-56e0fd2319f7","d777ba3b-8728-40d1-87a6-59406bbbbfb0":"34eb9c25-d5bf-49d9-859e-f74f4e0030e7"}}	1679987088524	1679987088524	0	bdw6esspakt8mjbsftshygmfiir	system	0	system
carj9px87c7gmxgrmtdy3mhg71a	2023-03-28 07:04:48.528499+00	bdw6esspakt8mjbsftshygmfiir	1	card	Offsite plans	{"contentOrder":["a9gdkxmgtg38itybak6js48uooo","7gu5muczduig37f8c349esesxdr","anxkk8ostxbg9mxsqfoes6a1kua","7yom7hiena7gtbpuf7tzwe397cc","7iokb3555w7fmbd7bymgbkg1h8w","77rr5we1iffd5jgs34kpjwfggic"],"icon":"🚙","isTemplate":false,"properties":{"4cf1568d-530f-4028-8ffd-bdc65249187e":"8b05c83e-a44a-4d04-831e-97f01d8e2003","d777ba3b-8728-40d1-87a6-59406bbbbfb0":"dabadd9b-adf1-4d9f-8702-805ac6cef602"}}	1679987088530	1679987088530	0	bdw6esspakt8mjbsftshygmfiir	system	0	system
ccr6sd6ku6jff8firg93myfibsw	2023-03-28 07:04:48.535159+00	bdw6esspakt8mjbsftshygmfiir	1	card	Social Media Strategy	{"contentOrder":["aysnamtnyntr73cnudf75ds5qpo","7n7xi4a1b93y4pcsryznkbwmbcc","anyz7usbfi3fifgrzs96qi1q77o","71agschiwwiyj5rz5c67t7wbg6o","74d7awcardffg5j14iq57kkm6jw","7uu6godbu63ns5edntaaagytmma"],"icon":"🎉","isTemplate":false,"properties":{"4cf1568d-530f-4028-8ffd-bdc65249187e":"b1abafbf-a038-4a19-8b68-56e0fd2319f7","d777ba3b-8728-40d1-87a6-59406bbbbfb0":"d37a61f4-f332-4db9-8b2d-5e0a91aa20ed"}}	1679987088537	1679987088537	0	bdw6esspakt8mjbsftshygmfiir	system	0	system
vsynfx3k7u3rtzxjezep8prorfh	2023-03-28 07:04:48.541799+00	bdw6esspakt8mjbsftshygmfiir	1	view	Discussion Items	{"cardOrder":["cjpkiya33qsagr4f9hrdwhgiajc"],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{},"defaultTemplateId":"ch798q5ucefyobf5bymgqjt4f3h","filter":{"filters":[],"operation":"and"},"groupById":"d777ba3b-8728-40d1-87a6-59406bbbbfb0","hiddenOptionIds":[""],"kanbanCalculations":{},"sortOptions":[{"propertyId":"4cf1568d-530f-4028-8ffd-bdc65249187e","reversed":false}],"viewType":"board","visibleOptionIds":[],"visiblePropertyIds":["4cf1568d-530f-4028-8ffd-bdc65249187e"]}	1679987088544	1679987088544	0	bdw6esspakt8mjbsftshygmfiir	system	0	system
7aau9uhe5tfg6jnctfxmnicejjo	2023-03-28 07:04:48.547969+00	cc9qypbmxhirypk55n55gdsgbgw	1	checkbox		{"value":false}	1679987088550	1679987088550	0	bdw6esspakt8mjbsftshygmfiir	system	0	system
7a7poh44cpbg1frfky8mp1n4n4e	2023-03-28 07:04:48.554169+00	cc9qypbmxhirypk55n55gdsgbgw	1	checkbox		{"value":false}	1679987088556	1679987088556	0	bdw6esspakt8mjbsftshygmfiir	system	0	system
7153484teg38yuquwizu5b9enie	2023-03-28 07:04:48.560146+00	cc9qypbmxhirypk55n55gdsgbgw	1	divider		{}	1679987088562	1679987088562	0	bdw6esspakt8mjbsftshygmfiir	system	0	system
7iw8x53xgmf8dxmemja9ocmx65h	2023-03-28 07:04:48.566124+00	cc9qypbmxhirypk55n55gdsgbgw	1	checkbox		{"value":false}	1679987088568	1679987088568	0	bdw6esspakt8mjbsftshygmfiir	system	0	system
a8uz114ebbjg3djyhtoo6krzzea	2023-03-28 07:04:48.572071+00	cc9qypbmxhirypk55n55gdsgbgw	1	text	## Notes\n*[Add meeting notes here]*	{}	1679987088574	1679987088574	0	bdw6esspakt8mjbsftshygmfiir	system	0	system
a7g3xuoxwijbajxtzi5o9n8zj4w	2023-03-28 07:04:48.577947+00	cc9qypbmxhirypk55n55gdsgbgw	1	text	## Action Items	{}	1679987088580	1679987088580	0	bdw6esspakt8mjbsftshygmfiir	system	0	system
7fse1gir37if1bj3jxnq6wrzt5c	2023-03-28 07:04:48.58433+00	ch798q5ucefyobf5bymgqjt4f3h	1	divider		{}	1679987088586	1679987088586	0	bdw6esspakt8mjbsftshygmfiir	system	0	system
74pe3bozp3jba9k76tz7p9m7c7o	2023-03-28 07:04:48.590759+00	ch798q5ucefyobf5bymgqjt4f3h	1	checkbox		{"value":false}	1679987088593	1679987088593	0	bdw6esspakt8mjbsftshygmfiir	system	0	system
7wmc4tyoiutd5ipo89b4i6cqhnr	2023-03-28 07:04:48.597179+00	ch798q5ucefyobf5bymgqjt4f3h	1	checkbox		{"value":false}	1679987088599	1679987088599	0	bdw6esspakt8mjbsftshygmfiir	system	0	system
7jhc8pxttq7rzpxxg5dh4y177wh	2023-03-28 07:04:48.603389+00	ch798q5ucefyobf5bymgqjt4f3h	1	checkbox		{"value":false}	1679987088605	1679987088605	0	bdw6esspakt8mjbsftshygmfiir	system	0	system
axk6ucaptwbfwpn1dbuw9m5xfpo	2023-03-28 07:04:48.609595+00	ch798q5ucefyobf5bymgqjt4f3h	1	text	# Action Items	{}	1679987088611	1679987088611	0	bdw6esspakt8mjbsftshygmfiir	system	0	system
a7wjnmk476idumbpju8traadrze	2023-03-28 07:04:48.616252+00	ch798q5ucefyobf5bymgqjt4f3h	1	text	# Notes\n*[Add meeting notes here]*	{}	1679987088618	1679987088618	0	bdw6esspakt8mjbsftshygmfiir	system	0	system
7pfrfz15am7y7fbfndi5rj44zko	2023-03-28 07:04:48.622381+00	cozgjgqgdnjf6uyt48qxuichnac	1	divider		{}	1679987088624	1679987088624	0	bdw6esspakt8mjbsftshygmfiir	system	0	system
7qb1us9k3y7dr7nywu4ssn6z4hh	2023-03-28 07:04:48.628376+00	cozgjgqgdnjf6uyt48qxuichnac	1	checkbox		{"value":false}	1679987088630	1679987088630	0	bdw6esspakt8mjbsftshygmfiir	system	0	system
7pozhzthdrt8kpeyi3qi67fmhuo	2023-03-28 07:04:48.635609+00	cozgjgqgdnjf6uyt48qxuichnac	1	checkbox		{"value":false}	1679987088638	1679987088638	0	bdw6esspakt8mjbsftshygmfiir	system	0	system
71tpu6qo34fgt7xkewyuwzfmdmc	2023-03-28 07:04:48.642137+00	cozgjgqgdnjf6uyt48qxuichnac	1	checkbox		{"value":false}	1679987088644	1679987088644	0	bdw6esspakt8mjbsftshygmfiir	system	0	system
au1ysitdzcir8idkxj5qe5qxxyo	2023-03-28 07:04:48.648858+00	cozgjgqgdnjf6uyt48qxuichnac	1	text	## Action Items	{}	1679987088651	1679987088651	0	bdw6esspakt8mjbsftshygmfiir	system	0	system
7yom7hiena7gtbpuf7tzwe397cc	2023-03-28 07:04:48.662415+00	carj9px87c7gmxgrmtdy3mhg71a	1	checkbox		{"value":false}	1679987088664	1679987088664	0	bdw6esspakt8mjbsftshygmfiir	system	0	system
7gu5muczduig37f8c349esesxdr	2023-03-28 07:04:48.675376+00	carj9px87c7gmxgrmtdy3mhg71a	1	divider		{}	1679987088677	1679987088677	0	bdw6esspakt8mjbsftshygmfiir	system	0	system
anxkk8ostxbg9mxsqfoes6a1kua	2023-03-28 07:04:48.688478+00	carj9px87c7gmxgrmtdy3mhg71a	1	text	## Action Items	{}	1679987088690	1679987088690	0	bdw6esspakt8mjbsftshygmfiir	system	0	system
7n7xi4a1b93y4pcsryznkbwmbcc	2023-03-28 07:04:48.701482+00	ccr6sd6ku6jff8firg93myfibsw	1	divider		{}	1679987088703	1679987088703	0	bdw6esspakt8mjbsftshygmfiir	system	0	system
7uu6godbu63ns5edntaaagytmma	2023-03-28 07:04:48.714813+00	ccr6sd6ku6jff8firg93myfibsw	1	checkbox		{"value":false}	1679987088717	1679987088717	0	bdw6esspakt8mjbsftshygmfiir	system	0	system
anyz7usbfi3fifgrzs96qi1q77o	2023-03-28 07:04:48.727884+00	ccr6sd6ku6jff8firg93myfibsw	1	text	## Action Items	{}	1679987088730	1679987088730	0	bdw6esspakt8mjbsftshygmfiir	system	0	system
bsbuz9bn36ir4jxts68eht1wyse	2023-03-28 07:04:48.741906+00		1	board	Personal Tasks 	{"cardProperties":[{"id":"a9zf59u8x1rf4ywctpcqama7tio","name":"Occurrence","options":[{"color":"propColorBlue","id":"an51dnkenmoog9cetapbc4uyt3y","value":"Daily"},{"color":"propColorOrange","id":"afpy8s7i45frggprmfsqngsocqh","value":"Weekly"},{"color":"propColorPurple","id":"aj4jyekqqssatjcq7r7chmy19ey","value":"Monthly"}],"type":"select"},{"id":"abthng7baedhhtrwsdodeuincqy","name":"Completed","options":[],"type":"checkbox"}],"description":"Use this template to organize your life and track your personal tasks.","icon":"✔️","isTemplate":true,"showDescription":true,"templateVer":4,"trackingTemplateId":"dfb70c146a4584b8a21837477c7b5431"}	1679987088744	1679987088744	0	bsbuz9bn36ir4jxts68eht1wyse	system	0	system
c47yr59qegiyudcigxx39pkspze	2023-03-28 07:04:48.756164+00	bsbuz9bn36ir4jxts68eht1wyse	1	card	Buy groceries	{"contentOrder":["am4k7iuzbkin3ffuf9wwnr4cjtw","7k9e6i7mjyina3endyhhw4t46ko","79stg4pbs1j813cyoh6mp3yu1oo","7qba1ifkb7brfunp4noqjg56nea","7unconyyzcbb6jg3p8qpfnudodc","7nqoiciay6fytmcngnwzfiu4aky","7s5zqqra1otgttce5bkb9q3kwae"],"icon":"🛒","isTemplate":false,"properties":{"a9zf59u8x1rf4ywctpcqama7tio":"afpy8s7i45frggprmfsqngsocqh"}}	1679987088758	1679987088758	0	bsbuz9bn36ir4jxts68eht1wyse	system	0	system
cmnjh9xbs8prqmqhw91k1111q8r	2023-03-28 07:04:48.768903+00	bsbuz9bn36ir4jxts68eht1wyse	1	card	Feed Fluffy	{"contentOrder":["a3ufh1d1jctrgzjm1fmcy3x1bpe"],"icon":"🐱","isTemplate":false,"properties":{"a9zf59u8x1rf4ywctpcqama7tio":"an51dnkenmoog9cetapbc4uyt3y"}}	1679987088771	1679987088771	0	bsbuz9bn36ir4jxts68eht1wyse	system	0	system
vcdt6738eotfq9jra7up74fusyw	2023-03-28 07:04:48.78127+00	bsbuz9bn36ir4jxts68eht1wyse	1	view	List View	{"cardOrder":[],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{"__title":280},"defaultTemplateId":"","filter":{"filters":[],"operation":"and"},"hiddenOptionIds":[],"kanbanCalculations":{},"sortOptions":[],"viewType":"table","visibleOptionIds":[],"visiblePropertyIds":["a9zf59u8x1rf4ywctpcqama7tio","abthng7baedhhtrwsdodeuincqy"]}	1679987088783	1679987088783	0	bsbuz9bn36ir4jxts68eht1wyse	system	0	system
7zmik5dnrhpgrpcnxd8i6gnomza	2023-03-28 07:04:48.794187+00	c8cmwys1w1brtxyxku3ztjkz9ge	1	checkbox	Utilities	{"value":true}	1679987088796	1679987088796	0	bsbuz9bn36ir4jxts68eht1wyse	system	0	system
7owsytsdnybrcueaf3i7s861bmr	2023-03-28 07:04:48.806456+00	c8cmwys1w1brtxyxku3ztjkz9ge	1	checkbox	Internet	{"value":true}	1679987088808	1679987088808	0	bsbuz9bn36ir4jxts68eht1wyse	system	0	system
7unconyyzcbb6jg3p8qpfnudodc	2023-03-28 07:04:48.81848+00	c47yr59qegiyudcigxx39pkspze	1	checkbox	Butter	{"value":false}	1679987088820	1679987088820	0	bsbuz9bn36ir4jxts68eht1wyse	system	0	system
7k9e6i7mjyina3endyhhw4t46ko	2023-03-28 07:04:48.831245+00	c47yr59qegiyudcigxx39pkspze	1	checkbox	Milk	{"value":false}	1679987088833	1679987088833	0	bsbuz9bn36ir4jxts68eht1wyse	system	0	system
79stg4pbs1j813cyoh6mp3yu1oo	2023-03-28 07:04:48.843678+00	c47yr59qegiyudcigxx39pkspze	1	checkbox	Eggs	{"value":false}	1679987088845	1679987088845	0	bsbuz9bn36ir4jxts68eht1wyse	system	0	system
7qz5cp7gediy1tj6azbqipi1r7a	2023-03-28 07:04:48.85695+00	cc7tu3c8ywty9ibsr453eqk58ja	1	image		{"fileId":"76fwrj36hptg6dywka4k5mt3sph.png"}	1679987088859	1679987088859	0	bsbuz9bn36ir4jxts68eht1wyse	system	0	system
awcys3dpgftby8exkqgz81j5oho	2023-03-28 07:04:48.869783+00	cc7tu3c8ywty9ibsr453eqk58ja	1	text	## Route	{}	1679987088872	1679987088872	0	bsbuz9bn36ir4jxts68eht1wyse	system	0	system
bg5bjah1fmbbs3eedts6kfdaneo	2023-03-28 07:04:48.987673+00		1	board	Project Tasks 	{"cardProperties":[{"id":"a972dc7a-5f4c-45d2-8044-8c28c69717f1","name":"Status","options":[{"color":"propColorBlue","id":"ayz81h9f3dwp7rzzbdebesc7ute","value":"Not Started"},{"color":"propColorYellow","id":"ar6b8m3jxr3asyxhr8iucdbo6yc","value":"In Progress"},{"color":"propColorRed","id":"afi4o5nhnqc3smtzs1hs3ij34dh","value":"Blocked"},{"color":"propColorGreen","id":"adeo5xuwne3qjue83fcozekz8ko","value":"Completed 🙌"},{"color":"propColorBrown","id":"ahpyxfnnrzynsw3im1psxpkgtpe","value":"Archived"}],"type":"select"},{"id":"d3d682bf-e074-49d9-8df5-7320921c2d23","name":"Priority","options":[{"color":"propColorRed","id":"d3bfb50f-f569-4bad-8a3a-dd15c3f60101","value":"1. High 🔥"},{"color":"propColorYellow","id":"87f59784-b859-4c24-8ebe-17c766e081dd","value":"2. Medium"},{"color":"propColorGray","id":"98a57627-0f76-471d-850d-91f3ed9fd213","value":"3. Low"}],"type":"select"},{"id":"axkhqa4jxr3jcqe4k87g8bhmary","name":"Assignee","options":[],"type":"person"},{"id":"a8daz81s4xjgke1ww6cwik5w7ye","name":"Estimated Hours","options":[],"type":"number"},{"id":"a3zsw7xs8sxy7atj8b6totp3mby","name":"Due Date","options":[],"type":"date"},{"id":"a7gdnz8ff8iyuqmzddjgmgo9ery","name":"Created By","options":[],"type":"createdBy"},{"id":"2a5da320-735c-4093-8787-f56e15cdfeed","name":"Date Created","options":[],"type":"createdTime"}],"description":"Use this template to stay on top of your project tasks and progress.","icon":"🎯","isTemplate":true,"showDescription":true,"templateVer":4,"trackingTemplateId":"a4ec399ab4f2088b1051c3cdf1dde4c3"}	1679987088990	1679987088990	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
cg3yoxg6e57gezydi4ekjneqear	2023-03-28 07:04:49.000803+00	bg5bjah1fmbbs3eedts6kfdaneo	1	card	Define project scope	{"contentOrder":["adk1hkaoguprfmfdgumdy795n6o","71b5y8bjaztbrue6uabw5fuud9r","a61nrrxockbdwur6uemcqqfcisy","7qo79dfad8fdsim1n547841w9na","7xz41ryoukfru9p8j6aa187wbdo","7acqmra67eiyuj8xhwk36kd6y3r","71i1847jqyf868m3ahm1ntu3ipo"],"icon":"🔬","isTemplate":false,"properties":{"a8daz81s4xjgke1ww6cwik5w7ye":"32","a972dc7a-5f4c-45d2-8044-8c28c69717f1":"ar6b8m3jxr3asyxhr8iucdbo6yc","d3d682bf-e074-49d9-8df5-7320921c2d23":"87f59784-b859-4c24-8ebe-17c766e081dd"}}	1679987089003	1679987089003	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
ahdsmycz5c3nbz8pcrux1ctiw4y	2023-03-28 07:04:49.667514+00	c4ion7h4ir3bdunms81f7cuphjc	1	text	## Summary\n*[Brief description of what this epic is about]*\n\n## Motivation\n*[Brief description on why this is needed]*\n\n## Acceptance Criteria\n - *[Criteron 1]*\n - *[Criteron 2]*\n - ...\n\n## Personas\n - *[Persona A]*\n - *[Persona B]*\n - ...\n\n## Reference Materials\n - *[Links to other relevant documents as needed]*\n - ...	{}	1679987089669	1679987089669	0	b78h88gsstbnfjk1tujcf6fx4ww	system	0	system
arkznzpaw83d6d8eeqqzokag8uh	2023-03-28 07:04:48.655792+00	cozgjgqgdnjf6uyt48qxuichnac	1	text	## Notes\n*[Add meeting notes here]*	{}	1679987088658	1679987088658	0	bdw6esspakt8mjbsftshygmfiir	system	0	system
7iokb3555w7fmbd7bymgbkg1h8w	2023-03-28 07:04:48.668725+00	carj9px87c7gmxgrmtdy3mhg71a	1	checkbox		{"value":false}	1679987088671	1679987088671	0	bdw6esspakt8mjbsftshygmfiir	system	0	system
77rr5we1iffd5jgs34kpjwfggic	2023-03-28 07:04:48.681943+00	carj9px87c7gmxgrmtdy3mhg71a	1	checkbox		{"value":false}	1679987088684	1679987088684	0	bdw6esspakt8mjbsftshygmfiir	system	0	system
a9gdkxmgtg38itybak6js48uooo	2023-03-28 07:04:48.69513+00	carj9px87c7gmxgrmtdy3mhg71a	1	text	## Notes\n*[Add meeting notes here]*	{}	1679987088697	1679987088697	0	bdw6esspakt8mjbsftshygmfiir	system	0	system
74d7awcardffg5j14iq57kkm6jw	2023-03-28 07:04:48.707802+00	ccr6sd6ku6jff8firg93myfibsw	1	checkbox		{"value":false}	1679987088710	1679987088710	0	bdw6esspakt8mjbsftshygmfiir	system	0	system
71agschiwwiyj5rz5c67t7wbg6o	2023-03-28 07:04:48.721293+00	ccr6sd6ku6jff8firg93myfibsw	1	checkbox		{"value":false}	1679987088723	1679987088723	0	bdw6esspakt8mjbsftshygmfiir	system	0	system
aysnamtnyntr73cnudf75ds5qpo	2023-03-28 07:04:48.734382+00	ccr6sd6ku6jff8firg93myfibsw	1	text	## Notes\n*[Add meeting notes here]*	{}	1679987088736	1679987088736	0	bdw6esspakt8mjbsftshygmfiir	system	0	system
c8cmwys1w1brtxyxku3ztjkz9ge	2023-03-28 07:04:48.749326+00	bsbuz9bn36ir4jxts68eht1wyse	1	card	Pay bills	{"contentOrder":["7uww5tmxg1tbu8yc454guujudac","7owsytsdnybrcueaf3i7s861bmr","7zmik5dnrhpgrpcnxd8i6gnomza"],"icon":"🔌","isTemplate":false,"properties":{"a9zf59u8x1rf4ywctpcqama7tio":"aj4jyekqqssatjcq7r7chmy19ey","abthng7baedhhtrwsdodeuincqy":"true"}}	1679987088751	1679987088751	0	bsbuz9bn36ir4jxts68eht1wyse	system	0	system
cc7tu3c8ywty9ibsr453eqk58ja	2023-03-28 07:04:48.76266+00	bsbuz9bn36ir4jxts68eht1wyse	1	card	Go for a walk	{"contentOrder":["au1u647azq3b9ijzjb5im435keo","awcys3dpgftby8exkqgz81j5oho","7qz5cp7gediy1tj6azbqipi1r7a"],"icon":"👣","isTemplate":false,"properties":{"a9zf59u8x1rf4ywctpcqama7tio":"an51dnkenmoog9cetapbc4uyt3y"}}	1679987088764	1679987088764	0	bsbuz9bn36ir4jxts68eht1wyse	system	0	system
cq71o3aowyfbsjdrtaidho5fqoe	2023-03-28 07:04:48.775446+00	bsbuz9bn36ir4jxts68eht1wyse	1	card	Gardening	{"contentOrder":[],"icon":"🌳","isTemplate":false,"properties":{"a9zf59u8x1rf4ywctpcqama7tio":"afpy8s7i45frggprmfsqngsocqh"}}	1679987088777	1679987088777	0	bsbuz9bn36ir4jxts68eht1wyse	system	0	system
vwmx1p1fhm3y9meehhpgurn5gxy	2023-03-28 07:04:48.787747+00	bsbuz9bn36ir4jxts68eht1wyse	1	view	Board View	{"cardOrder":["c47yr59qegiyudcigxx39pkspze","c8cmwys1w1brtxyxku3ztjkz9ge","cc7tu3c8ywty9ibsr453eqk58ja","cmnjh9xbs8prqmqhw91k1111q8r","czowhma7rnpgb3eczbqo3t7fijo"],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{},"defaultTemplateId":"cidrrzojxpfroicutox1hoyk91h","filter":{"filters":[],"operation":"and"},"groupById":"a9zf59u8x1rf4ywctpcqama7tio","hiddenOptionIds":[],"kanbanCalculations":{},"sortOptions":[],"viewType":"board","visibleOptionIds":["an51dnkenmoog9cetapbc4uyt3y","afpy8s7i45frggprmfsqngsocqh","aj4jyekqqssatjcq7r7chmy19ey",""],"visiblePropertyIds":["a9zf59u8x1rf4ywctpcqama7tio"]}	1679987088790	1679987088790	0	bsbuz9bn36ir4jxts68eht1wyse	system	0	system
7uww5tmxg1tbu8yc454guujudac	2023-03-28 07:04:48.800233+00	c8cmwys1w1brtxyxku3ztjkz9ge	1	checkbox	Mobile phone	{"value":true}	1679987088802	1679987088802	0	bsbuz9bn36ir4jxts68eht1wyse	system	0	system
7nqoiciay6fytmcngnwzfiu4aky	2023-03-28 07:04:48.812401+00	c47yr59qegiyudcigxx39pkspze	1	checkbox	Cereal	{"value":false}	1679987088814	1679987088814	0	bsbuz9bn36ir4jxts68eht1wyse	system	0	system
7qba1ifkb7brfunp4noqjg56nea	2023-03-28 07:04:48.82477+00	c47yr59qegiyudcigxx39pkspze	1	checkbox	Bread	{"value":false}	1679987088826	1679987088826	0	bsbuz9bn36ir4jxts68eht1wyse	system	0	system
7s5zqqra1otgttce5bkb9q3kwae	2023-03-28 07:04:48.837281+00	c47yr59qegiyudcigxx39pkspze	1	checkbox	Bananas	{"value":false}	1679987088839	1679987088839	0	bsbuz9bn36ir4jxts68eht1wyse	system	0	system
am4k7iuzbkin3ffuf9wwnr4cjtw	2023-03-28 07:04:48.850216+00	c47yr59qegiyudcigxx39pkspze	1	text	## Grocery list	{}	1679987088852	1679987088852	0	bsbuz9bn36ir4jxts68eht1wyse	system	0	system
au1u647azq3b9ijzjb5im435keo	2023-03-28 07:04:48.863302+00	cc7tu3c8ywty9ibsr453eqk58ja	1	text	## Goal\nWalk at least 10,000 steps every day.	{}	1679987088865	1679987088865	0	bsbuz9bn36ir4jxts68eht1wyse	system	0	system
a3ufh1d1jctrgzjm1fmcy3x1bpe	2023-03-28 07:04:48.87631+00	cmnjh9xbs8prqmqhw91k1111q8r	1	text		{}	1679987088878	1679987088878	0	bsbuz9bn36ir4jxts68eht1wyse	system	0	system
cxefo1ynaufbcdg58xj8yxuqo5h	2023-03-28 07:04:48.994605+00	bg5bjah1fmbbs3eedts6kfdaneo	1	card	Identify dependencies	{"contentOrder":["ap7w8cit3m3yyprkxikifbqamqa","7cxbaqnw6h7r9ffuc13m9poqdfa","a7qxjz8y5ofbnxcebkze94piwgr","7b3yazurtpffnbkw1t6xdiiycxr","7to1gfx6sbbnc7qzbhixui9jtgh","7nu9wd3mcrf8adfh195b1hwdzsr","7tkkzqmp8jibbjk33uuqnoxqnha"],"icon":"🔗","isTemplate":false,"properties":{"a8daz81s4xjgke1ww6cwik5w7ye":"16","a972dc7a-5f4c-45d2-8044-8c28c69717f1":"ayz81h9f3dwp7rzzbdebesc7ute","d3d682bf-e074-49d9-8df5-7320921c2d23":"98a57627-0f76-471d-850d-91f3ed9fd213"}}	1679987088997	1679987088997	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
cgk4i5eftp3bobcrykxmkhmhghe	2023-03-28 07:04:49.007491+00	bg5bjah1fmbbs3eedts6kfdaneo	1	card	Requirements sign-off	{"contentOrder":["a6ob8dqnmxf8ziddrrtaig4d8xa","7dbxxuoghkfrbtqro16k8myo1ue","atfmcuwgfu7nqik5yb5xkuy6bsw","7b6pns5chnigfimfsr58tnej5na","7667eaai5x3r9pqk8xiq5js567w","7fcsi7gk71bywxkj89mgbok71gh","7duodx8p65bbxujmcnt8xfpmndr"],"icon":"🖋️","isTemplate":false,"properties":{"a8daz81s4xjgke1ww6cwik5w7ye":"8","a972dc7a-5f4c-45d2-8044-8c28c69717f1":"ayz81h9f3dwp7rzzbdebesc7ute","d3d682bf-e074-49d9-8df5-7320921c2d23":"d3bfb50f-f569-4bad-8a3a-dd15c3f60101"}}	1679987089009	1679987089009	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
cig74rakze7nrtqdjif583pk16e	2023-03-28 07:04:49.019918+00	bg5bjah1fmbbs3eedts6kfdaneo	1	card	Conduct market analysis	{"contentOrder":["aurx9e7r5atyt9kasnq9jtsbjfo","7bdfjw1o9q78dmgs7jg7jxucrxa","agaxxygwyz7gb9ema3swxu8cich","7y9ue53xgxby38fbecdumn594ew","7a3daxfsy8irw9pfjgpqyij6cwh","7ywg3epcrcfrhtmgftuwae9pntr","7t9gnhnjg4fnjfethy4a84tdb7e"],"icon":"📈","isTemplate":false,"properties":{"a8daz81s4xjgke1ww6cwik5w7ye":"40","a972dc7a-5f4c-45d2-8044-8c28c69717f1":"ar6b8m3jxr3asyxhr8iucdbo6yc","d3d682bf-e074-49d9-8df5-7320921c2d23":"87f59784-b859-4c24-8ebe-17c766e081dd"}}	1679987089022	1679987089022	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
vnuq8tsbe1b8cf8a1dn4cq46xkc	2023-03-28 07:04:49.352871+00	be9zqbr58efnozm9tiriq1gfyww	1	view	By Status	{"cardOrder":[],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{},"defaultTemplateId":"","filter":{"filters":[],"operation":"and"},"groupById":"af6fcbb8-ca56-4b73-83eb-37437b9a667d","hiddenOptionIds":[],"kanbanCalculations":{},"sortOptions":[],"viewType":"board","visibleOptionIds":["bf52bfe6-ac4c-4948-821f-83eaa1c7b04a","77c539af-309c-4db1-8329-d20ef7e9eacd","98bdea27-0cce-4cde-8dc6-212add36e63a",""],"visiblePropertyIds":["d9725d14-d5a8-48e5-8de1-6f8c004a9680","d6b1249b-bc18-45fc-889e-bec48fce80ef"]}	1679987089355	1679987089355	0	be9zqbr58efnozm9tiriq1gfyww	system	0	system
aouab4whjb7ruxb1eo1hbe6mwba	2023-03-28 07:04:49.680539+00	co14yqycektdm5fofehfhmcidio	1	text	## Screenshots\n*[If applicable, add screenshots to elaborate on the problem.]*	{}	1679987089682	1679987089682	0	b78h88gsstbnfjk1tujcf6fx4ww	system	0	system
cn1xgzc5nzbgk5b7fmj1wkuw5zo	2023-03-28 07:04:49.013426+00	bg5bjah1fmbbs3eedts6kfdaneo	1	card	Project budget approval	{"contentOrder":["a9n14dsjw7pd9df9gnoxunsow9o","7t1rrscn8qbd3ddjk6k8mbwyreo","ak9kfj7imnp8a5qdezn8cgsz9dr","7i1wi88x7tfyn8c78wzic7gzrmo","7a3ukge8xxiddt8s9xh9ujizyzh","745qbcks3ubnrmdfi5n55afegka","7pacbuqepd7b9xkostj7wp6apew"],"icon":"💵","isTemplate":false,"properties":{"a8daz81s4xjgke1ww6cwik5w7ye":"16","a972dc7a-5f4c-45d2-8044-8c28c69717f1":"ayz81h9f3dwp7rzzbdebesc7ute","d3d682bf-e074-49d9-8df5-7320921c2d23":"d3bfb50f-f569-4bad-8a3a-dd15c3f60101"}}	1679987089015	1679987089015	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
vyarnnh4787rp9eyjpyrouok76h	2023-03-28 07:04:49.02575+00	bg5bjah1fmbbs3eedts6kfdaneo	1	view	Project Priorities	{"cardOrder":[],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{},"defaultTemplateId":"","filter":{"filters":[],"operation":"and"},"groupById":"d3d682bf-e074-49d9-8df5-7320921c2d23","hiddenOptionIds":[],"kanbanCalculations":{"":{"calculation":"sum","propertyId":"a8daz81s4xjgke1ww6cwik5w7ye"},"87f59784-b859-4c24-8ebe-17c766e081dd":{"calculation":"sum","propertyId":"a8daz81s4xjgke1ww6cwik5w7ye"},"98a57627-0f76-471d-850d-91f3ed9fd213":{"calculation":"sum","propertyId":"a8daz81s4xjgke1ww6cwik5w7ye"},"d3bfb50f-f569-4bad-8a3a-dd15c3f60101":{"calculation":"sum","propertyId":"a8daz81s4xjgke1ww6cwik5w7ye"}},"sortOptions":[],"viewType":"board","visibleOptionIds":["d3bfb50f-f569-4bad-8a3a-dd15c3f60101","87f59784-b859-4c24-8ebe-17c766e081dd","98a57627-0f76-471d-850d-91f3ed9fd213",""],"visiblePropertyIds":["a972dc7a-5f4c-45d2-8044-8c28c69717f1","a8daz81s4xjgke1ww6cwik5w7ye"]}	1679987089028	1679987089028	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
vfpnoehdw87b13quq4rji8ync9r	2023-03-28 07:04:49.038645+00	bg5bjah1fmbbs3eedts6kfdaneo	1	view	Task Overview	{"cardOrder":["cg3yoxg6e57gezydi4ekjneqear","cig74rakze7nrtqdjif583pk16e","cxefo1ynaufbcdg58xj8yxuqo5h","cn1xgzc5nzbgk5b7fmj1wkuw5zo","cgk4i5eftp3bobcrykxmkhmhghe","cz8p8gofakfby8kzz83j97db8ph","ce1jm5q5i54enhuu4h3kkay1hcc"],"collapsedOptionIds":[],"columnCalculations":{"a8daz81s4xjgke1ww6cwik5w7ye":"sum"},"columnWidths":{"2a5da320-735c-4093-8787-f56e15cdfeed":196,"__title":280,"a8daz81s4xjgke1ww6cwik5w7ye":139,"a972dc7a-5f4c-45d2-8044-8c28c69717f1":141,"d3d682bf-e074-49d9-8df5-7320921c2d23":110},"defaultTemplateId":"czw9es1e89fdpjr7cqptr1xq7qh","filter":{"filters":[],"operation":"and"},"groupById":"","hiddenOptionIds":[],"kanbanCalculations":{},"sortOptions":[],"viewType":"table","visibleOptionIds":[],"visiblePropertyIds":["a972dc7a-5f4c-45d2-8044-8c28c69717f1","d3d682bf-e074-49d9-8df5-7320921c2d23","2a5da320-735c-4093-8787-f56e15cdfeed","a3zsw7xs8sxy7atj8b6totp3mby","axkhqa4jxr3jcqe4k87g8bhmary","a7gdnz8ff8iyuqmzddjgmgo9ery","a8daz81s4xjgke1ww6cwik5w7ye"]}	1679987089041	1679987089041	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
7b3yazurtpffnbkw1t6xdiiycxr	2023-03-28 07:04:49.051558+00	cxefo1ynaufbcdg58xj8yxuqo5h	1	checkbox	[Subtask 1]	{"value":false}	1679987089053	1679987089053	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
7cxbaqnw6h7r9ffuc13m9poqdfa	2023-03-28 07:04:49.064286+00	cxefo1ynaufbcdg58xj8yxuqo5h	1	divider		{}	1679987089066	1679987089066	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
7nu9wd3mcrf8adfh195b1hwdzsr	2023-03-28 07:04:49.077152+00	cxefo1ynaufbcdg58xj8yxuqo5h	1	checkbox	[Subtask 3]	{"value":false}	1679987089079	1679987089079	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
ap7w8cit3m3yyprkxikifbqamqa	2023-03-28 07:04:49.090208+00	cxefo1ynaufbcdg58xj8yxuqo5h	1	text	## Description\n*[Brief description of this task]*	{}	1679987089092	1679987089092	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
71i1847jqyf868m3ahm1ntu3ipo	2023-03-28 07:04:49.102917+00	cg3yoxg6e57gezydi4ekjneqear	1	checkbox	...	{"value":false}	1679987089105	1679987089105	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
7acqmra67eiyuj8xhwk36kd6y3r	2023-03-28 07:04:49.115152+00	cg3yoxg6e57gezydi4ekjneqear	1	checkbox	[Subtask 3]	{"value":false}	1679987089117	1679987089117	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
a61nrrxockbdwur6uemcqqfcisy	2023-03-28 07:04:49.127531+00	cg3yoxg6e57gezydi4ekjneqear	1	text	## Checklist	{}	1679987089129	1679987089129	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
7duodx8p65bbxujmcnt8xfpmndr	2023-03-28 07:04:49.139916+00	cgk4i5eftp3bobcrykxmkhmhghe	1	checkbox	...	{"value":false}	1679987089142	1679987089142	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
7dbxxuoghkfrbtqro16k8myo1ue	2023-03-28 07:04:49.153814+00	cgk4i5eftp3bobcrykxmkhmhghe	1	divider		{}	1679987089156	1679987089156	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
7b6pns5chnigfimfsr58tnej5na	2023-03-28 07:04:49.167107+00	cgk4i5eftp3bobcrykxmkhmhghe	1	checkbox	[Subtask 1]	{"value":false}	1679987089169	1679987089169	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
atfmcuwgfu7nqik5yb5xkuy6bsw	2023-03-28 07:04:49.180295+00	cgk4i5eftp3bobcrykxmkhmhghe	1	text	## Checklist	{}	1679987089182	1679987089182	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
7i1wi88x7tfyn8c78wzic7gzrmo	2023-03-28 07:04:49.193443+00	cn1xgzc5nzbgk5b7fmj1wkuw5zo	1	checkbox	[Subtask 1]	{"value":false}	1679987089195	1679987089195	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
7pacbuqepd7b9xkostj7wp6apew	2023-03-28 07:04:49.206235+00	cn1xgzc5nzbgk5b7fmj1wkuw5zo	1	checkbox	...	{"value":false}	1679987089208	1679987089208	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
ak9kfj7imnp8a5qdezn8cgsz9dr	2023-03-28 07:04:49.21878+00	cn1xgzc5nzbgk5b7fmj1wkuw5zo	1	text	## Checklist	{}	1679987089220	1679987089220	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
7t9gnhnjg4fnjfethy4a84tdb7e	2023-03-28 07:04:49.231491+00	cig74rakze7nrtqdjif583pk16e	1	checkbox	...	{"value":false}	1679987089233	1679987089233	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
7bdfjw1o9q78dmgs7jg7jxucrxa	2023-03-28 07:04:49.243837+00	cig74rakze7nrtqdjif583pk16e	1	divider		{}	1679987089246	1679987089246	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
7y9ue53xgxby38fbecdumn594ew	2023-03-28 07:04:49.256425+00	cig74rakze7nrtqdjif583pk16e	1	checkbox	[Subtask 1]	{"value":false}	1679987089258	1679987089258	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
agaxxygwyz7gb9ema3swxu8cich	2023-03-28 07:04:49.268951+00	cig74rakze7nrtqdjif583pk16e	1	text	## Checklist	{}	1679987089271	1679987089271	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
7nsdcqg8oqf89zeyid98d7xhnyy	2023-03-28 07:04:49.281188+00	czw9es1e89fdpjr7cqptr1xq7qh	1	checkbox	[Subtask 2]	{"value":false}	1679987089283	1679987089283	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
7a1b1rsbb5bdjjdasd9yun6ssyo	2023-03-28 07:04:49.294065+00	czw9es1e89fdpjr7cqptr1xq7qh	1	checkbox	[Subtask 1]	{"value":false}	1679987089296	1679987089296	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
ajkazoofbpigbiro6in7bwpa3iw	2023-03-28 07:04:49.306864+00	czw9es1e89fdpjr7cqptr1xq7qh	1	text	## Description\n*[Brief description of this task]*	{}	1679987089309	1679987089309	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
axwwxncix8fd5dpp1c3chkdogsa	2023-03-28 07:04:49.61347+00	cr4jdkhckxfyzd8p9rurgy7y6yw	1	text	## Description\n*[Brief description of this task]*\n\n## Requirements\n- *[Requirement 1]*\n- *[Requirement 2]*\n- ...	{}	1679987089615	1679987089615	0	b78h88gsstbnfjk1tujcf6fx4ww	system	0	system
amdhndujcqpyd9g1oeehn7xs7ae	2023-03-28 07:04:49.626129+00	cfefgwjke6bbxpjpig618g9bpte	1	text	## Screenshots\nIf applicable, add screenshots to elaborate on the problem.	{}	1679987089628	1679987089628	0	b78h88gsstbnfjk1tujcf6fx4ww	system	0	system
vihztm13ocp8mdjnddmzcwrtc9o	2023-03-28 07:04:49.032111+00	bg5bjah1fmbbs3eedts6kfdaneo	1	view	Progress Tracker	{"cardOrder":["cn1xgzc5nzbgk5b7fmj1wkuw5zo","cgk4i5eftp3bobcrykxmkhmhghe","cxefo1ynaufbcdg58xj8yxuqo5h","cig74rakze7nrtqdjif583pk16e","cg3yoxg6e57gezydi4ekjneqear","coxnjt3ro1in19dd1e3awdt338r"],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{},"defaultTemplateId":"czw9es1e89fdpjr7cqptr1xq7qh","filter":{"filters":[],"operation":"and"},"groupById":"a972dc7a-5f4c-45d2-8044-8c28c69717f1","hiddenOptionIds":[],"kanbanCalculations":{"":{"calculation":"sum","propertyId":"a8daz81s4xjgke1ww6cwik5w7ye"},"adeo5xuwne3qjue83fcozekz8ko":{"calculation":"sum","propertyId":"a8daz81s4xjgke1ww6cwik5w7ye"},"afi4o5nhnqc3smtzs1hs3ij34dh":{"calculation":"sum","propertyId":"a8daz81s4xjgke1ww6cwik5w7ye"},"ahpyxfnnrzynsw3im1psxpkgtpe":{"calculation":"sum","propertyId":"a8daz81s4xjgke1ww6cwik5w7ye"},"ar6b8m3jxr3asyxhr8iucdbo6yc":{"calculation":"sum","propertyId":"a8daz81s4xjgke1ww6cwik5w7ye"},"ayz81h9f3dwp7rzzbdebesc7ute":{"calculation":"sum","propertyId":"a8daz81s4xjgke1ww6cwik5w7ye"}},"sortOptions":[],"viewType":"board","visibleOptionIds":["ayz81h9f3dwp7rzzbdebesc7ute","ar6b8m3jxr3asyxhr8iucdbo6yc","afi4o5nhnqc3smtzs1hs3ij34dh","adeo5xuwne3qjue83fcozekz8ko","ahpyxfnnrzynsw3im1psxpkgtpe",""],"visiblePropertyIds":["d3d682bf-e074-49d9-8df5-7320921c2d23","a8daz81s4xjgke1ww6cwik5w7ye"]}	1679987089034	1679987089034	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
v46esh4fz13yn5ebkxidzkqcnsa	2023-03-28 07:04:49.045355+00	bg5bjah1fmbbs3eedts6kfdaneo	1	view	Task Calendar	{"cardOrder":[],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{},"dateDisplayPropertyId":"a3zsw7xs8sxy7atj8b6totp3mby","defaultTemplateId":"","filter":{"filters":[],"operation":"and"},"hiddenOptionIds":[],"kanbanCalculations":{},"sortOptions":[],"viewType":"calendar","visibleOptionIds":[],"visiblePropertyIds":["__title"]}	1679987089047	1679987089047	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
7to1gfx6sbbnc7qzbhixui9jtgh	2023-03-28 07:04:49.058033+00	cxefo1ynaufbcdg58xj8yxuqo5h	1	checkbox	[Subtask 2]	{"value":false}	1679987089060	1679987089060	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
7tkkzqmp8jibbjk33uuqnoxqnha	2023-03-28 07:04:49.070735+00	cxefo1ynaufbcdg58xj8yxuqo5h	1	checkbox	...	{"value":false}	1679987089073	1679987089073	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
a7qxjz8y5ofbnxcebkze94piwgr	2023-03-28 07:04:49.083734+00	cxefo1ynaufbcdg58xj8yxuqo5h	1	text	## Checklist	{}	1679987089085	1679987089085	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
7xz41ryoukfru9p8j6aa187wbdo	2023-03-28 07:04:49.096924+00	cg3yoxg6e57gezydi4ekjneqear	1	checkbox	[Subtask 2]	{"value":false}	1679987089099	1679987089099	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
7qo79dfad8fdsim1n547841w9na	2023-03-28 07:04:49.109138+00	cg3yoxg6e57gezydi4ekjneqear	1	checkbox	[Subtask 1]	{"value":false}	1679987089111	1679987089111	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
71b5y8bjaztbrue6uabw5fuud9r	2023-03-28 07:04:49.121116+00	cg3yoxg6e57gezydi4ekjneqear	1	divider		{}	1679987089123	1679987089123	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
adk1hkaoguprfmfdgumdy795n6o	2023-03-28 07:04:49.133758+00	cg3yoxg6e57gezydi4ekjneqear	1	text	## Description\n*[Brief description of this task]*	{}	1679987089135	1679987089135	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
7667eaai5x3r9pqk8xiq5js567w	2023-03-28 07:04:49.147335+00	cgk4i5eftp3bobcrykxmkhmhghe	1	checkbox	[Subtask 2]	{"value":false}	1679987089149	1679987089149	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
7fcsi7gk71bywxkj89mgbok71gh	2023-03-28 07:04:49.160513+00	cgk4i5eftp3bobcrykxmkhmhghe	1	checkbox	[Subtask 3]	{"value":false}	1679987089162	1679987089162	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
a6ob8dqnmxf8ziddrrtaig4d8xa	2023-03-28 07:04:49.173952+00	cgk4i5eftp3bobcrykxmkhmhghe	1	text	## Description\n*[Brief description of this task]*	{}	1679987089176	1679987089176	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
7t1rrscn8qbd3ddjk6k8mbwyreo	2023-03-28 07:04:49.186591+00	cn1xgzc5nzbgk5b7fmj1wkuw5zo	1	divider		{}	1679987089188	1679987089188	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
745qbcks3ubnrmdfi5n55afegka	2023-03-28 07:04:49.199999+00	cn1xgzc5nzbgk5b7fmj1wkuw5zo	1	checkbox	[Subtask 3]	{"value":false}	1679987089202	1679987089202	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
7a3ukge8xxiddt8s9xh9ujizyzh	2023-03-28 07:04:49.21221+00	cn1xgzc5nzbgk5b7fmj1wkuw5zo	1	checkbox	[Subtask 2]	{"value":false}	1679987089214	1679987089214	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
a9n14dsjw7pd9df9gnoxunsow9o	2023-03-28 07:04:49.225434+00	cn1xgzc5nzbgk5b7fmj1wkuw5zo	1	text	## Description\n*[Brief description of this task]*	{}	1679987089227	1679987089227	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
7ywg3epcrcfrhtmgftuwae9pntr	2023-03-28 07:04:49.237531+00	cig74rakze7nrtqdjif583pk16e	1	checkbox	[Subtask 3]	{"value":false}	1679987089239	1679987089239	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
7a3daxfsy8irw9pfjgpqyij6cwh	2023-03-28 07:04:49.250378+00	cig74rakze7nrtqdjif583pk16e	1	checkbox	[Subtask 2]	{"value":false}	1679987089252	1679987089252	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
aurx9e7r5atyt9kasnq9jtsbjfo	2023-03-28 07:04:49.26268+00	cig74rakze7nrtqdjif583pk16e	1	text	## Description\n*[Brief description of this task]*	{}	1679987089264	1679987089264	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
7zs3kronwitfxmfjjrozfwmy36o	2023-03-28 07:04:49.275272+00	czw9es1e89fdpjr7cqptr1xq7qh	1	checkbox	[Subtask 3]	{"value":false}	1679987089277	1679987089277	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
7duygxtiiqin8fnyi193bxnrswr	2023-03-28 07:04:49.287764+00	czw9es1e89fdpjr7cqptr1xq7qh	1	divider		{}	1679987089289	1679987089289	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
7maymix349t8fdmy1cwqcqgp5oe	2023-03-28 07:04:49.300524+00	czw9es1e89fdpjr7cqptr1xq7qh	1	checkbox	...	{"value":false}	1679987089302	1679987089302	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
ayxkdoyjy6bby7ynpqzp5rjjidc	2023-03-28 07:04:49.31337+00	czw9es1e89fdpjr7cqptr1xq7qh	1	text	## Checklist	{}	1679987089315	1679987089315	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
cj6md4iqef3nwbkcg81ujy4zsxr	2023-03-28 07:04:49.327204+00	be9zqbr58efnozm9tiriq1gfyww	1	card	Start a daily journal	{"contentOrder":[],"icon":"✍️","isTemplate":false,"properties":{"af6fcbb8-ca56-4b73-83eb-37437b9a667d":"bf52bfe6-ac4c-4948-821f-83eaa1c7b04a","d6b1249b-bc18-45fc-889e-bec48fce80ef":"0a82977f-52bf-457b-841b-e2b7f76fb525","d9725d14-d5a8-48e5-8de1-6f8c004a9680":"3245a32d-f688-463b-87f4-8e7142c1b397"}}	1679987089329	1679987089329	0	be9zqbr58efnozm9tiriq1gfyww	system	0	system
c6datwj5oejrhxntkeszg35gkxw	2023-03-28 07:04:49.340014+00	be9zqbr58efnozm9tiriq1gfyww	1	card	Learn to paint	{"contentOrder":[],"icon":"🎨","isTemplate":false,"properties":{"af6fcbb8-ca56-4b73-83eb-37437b9a667d":"77c539af-309c-4db1-8329-d20ef7e9eacd","d6b1249b-bc18-45fc-889e-bec48fce80ef":"9a090e33-b110-4268-8909-132c5002c90e","d9725d14-d5a8-48e5-8de1-6f8c004a9680":"3245a32d-f688-463b-87f4-8e7142c1b397"}}	1679987089342	1679987089342	0	be9zqbr58efnozm9tiriq1gfyww	system	0	system
7io4zth6i7bnmuedkzzj1esnccr	2023-03-28 07:04:49.870273+00	cxxmymfyz8jy5zjh7ztrrzwurrw	1	checkbox	Set priorities and update statuses	{"value":false}	1679987089872	1679987089872	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
be9zqbr58efnozm9tiriq1gfyww	2023-03-28 07:04:49.320399+00		1	board	Personal Goals 	{"cardProperties":[{"id":"af6fcbb8-ca56-4b73-83eb-37437b9a667d","name":"Status","options":[{"color":"propColorRed","id":"bf52bfe6-ac4c-4948-821f-83eaa1c7b04a","value":"To Do"},{"color":"propColorYellow","id":"77c539af-309c-4db1-8329-d20ef7e9eacd","value":"Doing"},{"color":"propColorGreen","id":"98bdea27-0cce-4cde-8dc6-212add36e63a","value":"Done 🙌"}],"type":"select"},{"id":"d9725d14-d5a8-48e5-8de1-6f8c004a9680","name":"Category","options":[{"color":"propColorPurple","id":"3245a32d-f688-463b-87f4-8e7142c1b397","value":"Life Skills"},{"color":"propColorGreen","id":"80be816c-fc7a-4928-8489-8b02180f4954","value":"Finance"},{"color":"propColorOrange","id":"ffb3f951-b47f-413b-8f1d-238666728008","value":"Health"}],"type":"select"},{"id":"d6b1249b-bc18-45fc-889e-bec48fce80ef","name":"Target","options":[{"color":"propColorBlue","id":"9a090e33-b110-4268-8909-132c5002c90e","value":"Q1"},{"color":"propColorBrown","id":"0a82977f-52bf-457b-841b-e2b7f76fb525","value":"Q2"},{"color":"propColorGreen","id":"6e7139e4-5358-46bb-8c01-7b029a57b80a","value":"Q3"},{"color":"propColorPurple","id":"d5371c63-66bf-4468-8738-c4dc4bea4843","value":"Q4"}],"type":"select"},{"id":"ajy6xbebzopojaenbnmfpgtdwso","name":"Due Date","options":[],"type":"date"}],"description":"Use this template to set and accomplish new personal goals.","icon":"⛰️","isTemplate":true,"showDescription":true,"templateVer":4,"trackingTemplateId":"7f32dc8d2ae008cfe56554e9363505cc"}	1679987089322	1679987089322	0	be9zqbr58efnozm9tiriq1gfyww	system	0	system
cp31watzh13g39ykcngbyjdco4a	2023-03-28 07:04:49.333653+00	be9zqbr58efnozm9tiriq1gfyww	1	card	Run 3 times a week	{"contentOrder":[],"icon":"🏃","isTemplate":false,"properties":{"af6fcbb8-ca56-4b73-83eb-37437b9a667d":"bf52bfe6-ac4c-4948-821f-83eaa1c7b04a","d6b1249b-bc18-45fc-889e-bec48fce80ef":"6e7139e4-5358-46bb-8c01-7b029a57b80a","d9725d14-d5a8-48e5-8de1-6f8c004a9680":"ffb3f951-b47f-413b-8f1d-238666728008"}}	1679987089336	1679987089336	0	be9zqbr58efnozm9tiriq1gfyww	system	0	system
cnnmjrea1utftxmasdwpxfitaey	2023-03-28 07:04:49.346747+00	be9zqbr58efnozm9tiriq1gfyww	1	card	Open retirement account	{"contentOrder":[],"icon":"🏦","isTemplate":false,"properties":{"af6fcbb8-ca56-4b73-83eb-37437b9a667d":"bf52bfe6-ac4c-4948-821f-83eaa1c7b04a","d6b1249b-bc18-45fc-889e-bec48fce80ef":"0a82977f-52bf-457b-841b-e2b7f76fb525","d9725d14-d5a8-48e5-8de1-6f8c004a9680":"80be816c-fc7a-4928-8489-8b02180f4954"}}	1679987089349	1679987089349	0	be9zqbr58efnozm9tiriq1gfyww	system	0	system
vgietbc8izbbojjbuw3hc61n7uo	2023-03-28 07:04:49.359151+00	be9zqbr58efnozm9tiriq1gfyww	1	view	Calendar View	{"cardOrder":[],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{},"dateDisplayPropertyId":"ajy6xbebzopojaenbnmfpgtdwso","defaultTemplateId":"","filter":{"filters":[],"operation":"and"},"hiddenOptionIds":[],"kanbanCalculations":{},"sortOptions":[],"viewType":"calendar","visibleOptionIds":[],"visiblePropertyIds":["__title"]}	1679987089361	1679987089361	0	be9zqbr58efnozm9tiriq1gfyww	system	0	system
bgg9adjeykfdu9n5jrsja9ci73w	2023-03-28 07:04:49.37589+00		1	board	Content Calendar 	{"cardProperties":[{"id":"ae9ar615xoknd8hw8py7mbyr7zo","name":"Status","options":[{"color":"propColorGray","id":"awna1nuarjca99m9s4uiy9kwj5h","value":"Idea 💡"},{"color":"propColorOrange","id":"a9ana1e9w673o5cp8md4xjjwfto","value":"Draft"},{"color":"propColorPurple","id":"apy9dcd7zmand615p3h53zjqxjh","value":"In Review"},{"color":"propColorBlue","id":"acri4cm3bmay55f7ksztphmtnga","value":"Ready to Publish"},{"color":"propColorGreen","id":"amsowcd9a8e1kid317r7ttw6uzh","value":"Published 🎉"}],"type":"select"},{"id":"aysx3atqexotgwp5kx6h5i5ancw","name":"Type","options":[{"color":"propColorOrange","id":"aywiofmmtd3ofgzj95ysky4pjga","value":"Press Release"},{"color":"propColorGreen","id":"apqdgjrmsmx8ngmp7zst51647de","value":"Sponsored Post"},{"color":"propColorPurple","id":"a3woynbjnb7j16e74uw3pubrytw","value":"Customer Story"},{"color":"propColorRed","id":"aq36k5pkpfcypqb3idw36xdi1fh","value":"Product Release"},{"color":"propColorGray","id":"azn66pmk34adygnizjqhgiac4ia","value":"Partnership"},{"color":"propColorBlue","id":"aj8y675weso8kpb6eceqbpj4ruw","value":"Feature Announcement"},{"color":"propColorYellow","id":"a3xky7ygn14osr1mokerbfah5cy","value":"Article"}],"type":"select"},{"id":"ab6mbock6styfe6htf815ph1mhw","name":"Channel","options":[{"color":"propColorBrown","id":"a8xceonxiu4n3c43szhskqizicr","value":"Website"},{"color":"propColorGreen","id":"a3pdzi53kpbd4okzdkz6khi87zo","value":"Blog"},{"color":"propColorOrange","id":"a3d9ux4fmi3anyd11kyipfbhwde","value":"Email"},{"color":"propColorRed","id":"a8cbbfdwocx73zn3787cx6gacsh","value":"Podcast"},{"color":"propColorPink","id":"aigjtpcaxdp7d6kmctrwo1ztaia","value":"Print"},{"color":"propColorBlue","id":"af1wsn13muho59e7ghwaogxy5ey","value":"Facebook"},{"color":"propColorGray","id":"a47zajfxwhsg6q8m7ppbiqs7jge","value":"LinkedIn"},{"color":"propColorYellow","id":"az8o8pfe9hq6s7xaehoqyc3wpyc","value":"Twitter"}],"type":"multiSelect"},{"id":"ao44fz8nf6z6tuj1x31t9yyehcc","name":"Assignee","options":[],"type":"person"},{"id":"a39x5cybshwrbjpc3juaakcyj6e","name":"Due Date","options":[],"type":"date"},{"id":"agqsoiipowmnu9rdwxm57zrehtr","name":"Publication Date","options":[],"type":"date"},{"id":"ap4e7kdg7eip7j3c3oyiz39eaoc","name":"Link","options":[],"type":"url"}],"description":"Use this template to plan and organize your editorial content.","icon":"📅","isTemplate":true,"showDescription":true,"templateVer":4,"trackingTemplateId":"c75fbd659d2258b5183af2236d176ab4"}	1679987089379	1679987089379	0	bgg9adjeykfdu9n5jrsja9ci73w	system	0	system
cdcgxou56i3yybr5tcndnj8ufba	2023-03-28 07:04:49.39089+00	bgg9adjeykfdu9n5jrsja9ci73w	1	card	[Tweet] Mattermost v6.1 includes card @-mention notifications in Boards	{"contentOrder":["7i96m7nbsdsex8n6hzuzrmdfjuy","7ed5bwp3gr8yax3mhtuwiaa9gjy","a6k49iuhpabd7xp19hisoxrpmaw","aipt73yisntrszg4mojgtbo6gar","abdasiyq4k7ndtfrdadrias8sjy","7ms5wci8spjrdjp3qq6ns1kc5tr"],"icon":"🐤","isTemplate":false,"properties":{"a39x5cybshwrbjpc3juaakcyj6e":"{\\"from\\":1639051200000}","ab6mbock6styfe6htf815ph1mhw":["az8o8pfe9hq6s7xaehoqyc3wpyc"],"ae9ar615xoknd8hw8py7mbyr7zo":"a9ana1e9w673o5cp8md4xjjwfto","agqsoiipowmnu9rdwxm57zrehtr":"{\\"from\\":1637668800000}","ap4e7kdg7eip7j3c3oyiz39eaoc":"https://twitter.com/Mattermost/status/1463145633162969097?s=20","aysx3atqexotgwp5kx6h5i5ancw":"aj8y675weso8kpb6eceqbpj4ruw"}}	1679987089393	1679987089393	0	bgg9adjeykfdu9n5jrsja9ci73w	system	0	system
cq3oek9htutb9fpr43u8fk49u7e	2023-03-28 07:04:49.40341+00	bgg9adjeykfdu9n5jrsja9ci73w	1	card	Unblocking Workflows: The Guide to Developer Productivity	{"contentOrder":["77tz16jtz5x73ncs3dxc3fp1d7h","aghhgqaieubyo3nnroieme8f19w"],"icon":"💻","isTemplate":false,"properties":{"a39x5cybshwrbjpc3juaakcyj6e":"{\\"from\\":1638532800000}","ab6mbock6styfe6htf815ph1mhw":["a3pdzi53kpbd4okzdkz6khi87zo"],"ae9ar615xoknd8hw8py7mbyr7zo":"apy9dcd7zmand615p3h53zjqxjh","agqsoiipowmnu9rdwxm57zrehtr":"{\\"from\\":1639483200000}","ap4e7kdg7eip7j3c3oyiz39eaoc":"https://mattermost.com/newsroom/press-releases/mattermost-unveils-definitive-report-on-the-state-of-developer-productivity-unblocking-workflows-the-guide-to-developer-productivity-2022-edition/","aysx3atqexotgwp5kx6h5i5ancw":"a3xky7ygn14osr1mokerbfah5cy"}}	1679987089405	1679987089405	0	bgg9adjeykfdu9n5jrsja9ci73w	system	0	system
vnxs8cwanctb7ubjn18mq9shg9a	2023-03-28 07:04:49.41655+00	bgg9adjeykfdu9n5jrsja9ci73w	1	view	Due Date Calendar	{"cardOrder":[],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{},"dateDisplayPropertyId":"a39x5cybshwrbjpc3juaakcyj6e","defaultTemplateId":"cff1jmrxfrirgbeebhr9qd7nida","filter":{"filters":[],"operation":"and"},"hiddenOptionIds":[],"kanbanCalculations":{},"sortOptions":[],"viewType":"calendar","visibleOptionIds":[],"visiblePropertyIds":["__title"]}	1679987089418	1679987089418	0	bgg9adjeykfdu9n5jrsja9ci73w	system	0	system
aej55m9ebipb1ugp8netwkdkdic	2023-03-28 07:04:49.639883+00	cfefgwjke6bbxpjpig618g9bpte	1	text	## Steps to reproduce the behavior\n\n1. Go to ...\n2. Select  ...\n3. Scroll down to ...\n4. See error\n\n## Expected behavior\n\n*[A clear and concise description of what you expected to happen.]*\n\n## Screenshots\n\n*[If applicable, add screenshots to elaborate on the problem.]*\n\n## Edition and Platform\n\n - Edition: *[e.g. Personal Desktop / Personal Server / Mattermost plugin]*\n - Version: *[e.g. v0.9.0]*\n - Browser and OS: *[e.g. Chrome 91 on macOS, Edge 93 on Windows]*\n\n## Additional context\n\n*[Add any other context about the problem here.]*	{}	1679987089642	1679987089642	0	b78h88gsstbnfjk1tujcf6fx4ww	system	0	system
v1uk5t65omfb88mtgsdt6p8gjpo	2023-03-28 07:04:49.365638+00	be9zqbr58efnozm9tiriq1gfyww	1	view	By Date	{"cardOrder":[],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{},"defaultTemplateId":"","filter":{"filters":[],"operation":"and"},"groupById":"d6b1249b-bc18-45fc-889e-bec48fce80ef","hiddenOptionIds":[],"kanbanCalculations":{},"sortOptions":[],"viewType":"board","visibleOptionIds":["9a090e33-b110-4268-8909-132c5002c90e","0a82977f-52bf-457b-841b-e2b7f76fb525","6e7139e4-5358-46bb-8c01-7b029a57b80a","d5371c63-66bf-4468-8738-c4dc4bea4843",""],"visiblePropertyIds":["d9725d14-d5a8-48e5-8de1-6f8c004a9680"]}	1679987089368	1679987089367	0	be9zqbr58efnozm9tiriq1gfyww	system	0	system
cqecoatk3kb8gbf34q8y8dxw1hc	2023-03-28 07:04:49.384407+00	bgg9adjeykfdu9n5jrsja9ci73w	1	card	New Project and Workflow Management Solutions for Developers	{"contentOrder":["71qhnzuec6esdi6fnynwpze4xya","anm485iek57f5mjmt6snb87e19w"],"icon":"🎯","isTemplate":false,"properties":{"a39x5cybshwrbjpc3juaakcyj6e":"{\\"from\\":1645790400000}","ab6mbock6styfe6htf815ph1mhw":["a8xceonxiu4n3c43szhskqizicr","a3pdzi53kpbd4okzdkz6khi87zo","a3d9ux4fmi3anyd11kyipfbhwde"],"ae9ar615xoknd8hw8py7mbyr7zo":"awna1nuarjca99m9s4uiy9kwj5h","ap4e7kdg7eip7j3c3oyiz39eaoc":"https://mattermost.com/newsroom/press-releases/mattermost-launches-new-project-and-workflow-management-solutions-for-developers/","aysx3atqexotgwp5kx6h5i5ancw":"aywiofmmtd3ofgzj95ysky4pjga"}}	1679987089386	1679987089386	0	bgg9adjeykfdu9n5jrsja9ci73w	system	0	system
chee7jnbukbrm8n4a6983nox7za	2023-03-28 07:04:49.396985+00	bgg9adjeykfdu9n5jrsja9ci73w	1	card	Top 10 Must-Have DevOps Tools in 2021	{"contentOrder":["7fo1utqc8x1z1z6hzg33hes1ktc","abz8sfh7z13y6ipfxrk9d4nasoa"],"icon":"🛠️","isTemplate":false,"properties":{"a39x5cybshwrbjpc3juaakcyj6e":"{\\"from\\":1636113600000}","ab6mbock6styfe6htf815ph1mhw":["a8xceonxiu4n3c43szhskqizicr"],"ae9ar615xoknd8hw8py7mbyr7zo":"a9ana1e9w673o5cp8md4xjjwfto","agqsoiipowmnu9rdwxm57zrehtr":"{\\"from\\":1637323200000}","ap4e7kdg7eip7j3c3oyiz39eaoc":"https://www.toolbox.com/tech/devops/articles/best-devops-tools/","aysx3atqexotgwp5kx6h5i5ancw":"a3xky7ygn14osr1mokerbfah5cy"}}	1679987089399	1679987089399	0	bgg9adjeykfdu9n5jrsja9ci73w	system	0	system
ve8ne6mezf3f9txryomanbtrfiy	2023-03-28 07:04:49.409913+00	bgg9adjeykfdu9n5jrsja9ci73w	1	view	By Status	{"cardOrder":[null,"cdbfkd15d6iy18rgx1tskmfsr6c","cn8yofg9rtkgmzgmb5xdi56p3ic","csgsnnywpuqzs5jgq87snk9x17e","cqwaytore5y487wdu8zffppqnea",null],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{},"defaultTemplateId":"cff1jmrxfrirgbeebhr9qd7nida","filter":{"filters":[],"operation":"and"},"hiddenOptionIds":[],"kanbanCalculations":{},"sortOptions":[],"viewType":"board","visibleOptionIds":["awna1nuarjca99m9s4uiy9kwj5h","a9ana1e9w673o5cp8md4xjjwfto","apy9dcd7zmand615p3h53zjqxjh","acri4cm3bmay55f7ksztphmtnga","amsowcd9a8e1kid317r7ttw6uzh",""],"visiblePropertyIds":["ab6mbock6styfe6htf815ph1mhw"]}	1679987089412	1679987089412	0	bgg9adjeykfdu9n5jrsja9ci73w	system	0	system
vt4jd6k5d7jrn5r6hr4jnhxu81e	2023-03-28 07:04:49.423081+00	bgg9adjeykfdu9n5jrsja9ci73w	1	view	Publication Calendar	{"cardOrder":[],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{},"dateDisplayPropertyId":"agqsoiipowmnu9rdwxm57zrehtr","defaultTemplateId":"cff1jmrxfrirgbeebhr9qd7nida","filter":{"filters":[],"operation":"and"},"hiddenOptionIds":[],"kanbanCalculations":{},"sortOptions":[],"viewType":"calendar","visibleOptionIds":[],"visiblePropertyIds":["__title"]}	1679987089425	1679987089425	0	bgg9adjeykfdu9n5jrsja9ci73w	system	0	system
anm485iek57f5mjmt6snb87e19w	2023-03-28 07:04:49.436508+00	cqecoatk3kb8gbf34q8y8dxw1hc	1	text	## Research\n- ...\n- ...\n\n## Plan\n- ...\n- ...\n\n## Notes\n- ...\n- ...	{}	1679987089438	1679987089438	0	bgg9adjeykfdu9n5jrsja9ci73w	system	0	system
a6k49iuhpabd7xp19hisoxrpmaw	2023-03-28 07:04:49.449515+00	cdcgxou56i3yybr5tcndnj8ufba	1	text	## Research\n- ...\n- ...\n\n## Plan\n- ...\n- ...\n\n## Notes\n- ...\n- ...	{}	1679987089451	1679987089451	0	bgg9adjeykfdu9n5jrsja9ci73w	system	0	system
au337851hkfnepxdb9udy8knthy	2023-03-28 07:04:49.462935+00	cff1jmrxfrirgbeebhr9qd7nida	1	text	## Research\n- ...\n- ...\n\n## Plan\n- ...\n- ...\n\n## Notes\n- ...\n- ...	{}	1679987089465	1679987089465	0	bgg9adjeykfdu9n5jrsja9ci73w	system	0	system
ajkuf1rku83yiu83zksgqmqux4w	2023-03-28 07:04:49.475709+00	cff1jmrxfrirgbeebhr9qd7nida	1	text	## Research\n- ...\n- ...\n\n## Plan\n- ...\n- ...\n\n## Notes\n- ...\n- ...	{}	1679987089477	1679987089477	0	bgg9adjeykfdu9n5jrsja9ci73w	system	0	system
aghhgqaieubyo3nnroieme8f19w	2023-03-28 07:04:49.488265+00	cq3oek9htutb9fpr43u8fk49u7e	1	text	## Research\n- ...\n- ...\n\n## Plan\n- ...\n- ...\n\n## Notes\n- ...\n- ...	{}	1679987089490	1679987089490	0	bgg9adjeykfdu9n5jrsja9ci73w	system	0	system
cmmetesf4wfrizxrmfk1xc66fcw	2023-03-28 07:04:49.515581+00	b78h88gsstbnfjk1tujcf6fx4ww	1	card	App crashing	{"contentOrder":["79t7rkiuspeneqi9xurou9tqzwh","aozms76o85prndfqtigkqixqame","a3stx3gaxnp8f7y4p5fjypcnj3y","73egy4qcmc78hzfacr83dqbh1uh"],"icon":"📉","isTemplate":false,"properties":{"20717ad3-5741-4416-83f1-6f133fff3d11":"1fdbb515-edd2-4af5-80fc-437ed2211a49","50117d52-bcc7-4750-82aa-831a351c44a0":"ec6d2bc5-df2b-4f77-8479-e59ceb039946","60985f46-3e41-486e-8213-2b987440ea1c":"c01676ca-babf-4534-8be5-cce2287daa6c","f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e":"cb8ecdac-38be-4d36-8712-c4d58cc8a8e9"}}	1679987089517	1679987089517	0	b78h88gsstbnfjk1tujcf6fx4ww	system	0	system
cr4jdkhckxfyzd8p9rurgy7y6yw	2023-03-28 07:04:49.528542+00	b78h88gsstbnfjk1tujcf6fx4ww	1	card	Standard templates	{"contentOrder":["7uonmjk41nipnrsi6tz8wau5ssh","axwwxncix8fd5dpp1c3chkdogsa"],"icon":"🗺️","isTemplate":false,"properties":{"20717ad3-5741-4416-83f1-6f133fff3d11":"6eea96c9-4c61-4968-8554-4b7537e8f748","50117d52-bcc7-4750-82aa-831a351c44a0":"ec6d2bc5-df2b-4f77-8479-e59ceb039946","60985f46-3e41-486e-8213-2b987440ea1c":"ed4a5340-460d-461b-8838-2c56e8ee59fe","ai7ajsdk14w7x5s8up3dwir77te":"https://mattermost.com/boards/","f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e":"e6a7f297-4440-4783-8ab3-3af5ba62ca11"}}	1679987089531	1679987089531	0	b78h88gsstbnfjk1tujcf6fx4ww	system	0	system
c4ion7h4ir3bdunms81f7cuphjc	2023-03-28 07:04:49.54201+00	b78h88gsstbnfjk1tujcf6fx4ww	1	card	Review API design	{"contentOrder":["ahdsmycz5c3nbz8pcrux1ctiw4y"],"icon":"🛣️","isTemplate":false,"properties":{"20717ad3-5741-4416-83f1-6f133fff3d11":"424ea5e3-9aa1-4075-8c5c-01b44b66e634","50117d52-bcc7-4750-82aa-831a351c44a0":"8c557f69-b0ed-46ec-83a3-8efab9d47ef5","60985f46-3e41-486e-8213-2b987440ea1c":"14892380-1a32-42dd-8034-a0cea32bc7e6","ai7ajsdk14w7x5s8up3dwir77te":"https://mattermost.com/boards/","f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e":"c62172ea-5da7-4dec-8186-37267d8ee9a7"}}	1679987089544	1679987089544	0	b78h88gsstbnfjk1tujcf6fx4ww	system	0	system
vpnnrtoqkyfgf5qy3t79b41nddy	2023-03-28 07:04:49.555012+00	b78h88gsstbnfjk1tujcf6fx4ww	1	view	Calendar View	{"cardOrder":[],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{},"dateDisplayPropertyId":"a4378omyhmgj3bex13sj4wbpfiy","defaultTemplateId":"","filter":{"filters":[],"operation":"and"},"hiddenOptionIds":[],"kanbanCalculations":{},"sortOptions":[],"viewType":"calendar","visibleOptionIds":[],"visiblePropertyIds":["__title"]}	1679987089557	1679987089557	0	b78h88gsstbnfjk1tujcf6fx4ww	system	0	system
a9x8t54yhppf4imxp11e5y3bjwc	2023-03-28 07:04:49.653756+00	cidz4imnqhir48brz6e8hxhfrhy	1	text	## Description\n*[Brief description of this task]*\n\n## Requirements\n- *[Requirement 1]*\n- *[Requirement 2]*\n- ...	{}	1679987089656	1679987089656	0	b78h88gsstbnfjk1tujcf6fx4ww	system	0	system
vc66mno9g3fr9jc8ioaiekeyo6w	2023-03-28 07:04:49.429531+00	bgg9adjeykfdu9n5jrsja9ci73w	1	view	Content List	{"cardOrder":[],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{"__title":322,"ab6mbock6styfe6htf815ph1mhw":229,"aysx3atqexotgwp5kx6h5i5ancw":208},"defaultTemplateId":"cff1jmrxfrirgbeebhr9qd7nida","filter":{"filters":[],"operation":"and"},"hiddenOptionIds":[],"kanbanCalculations":{},"sortOptions":[{"propertyId":"a39x5cybshwrbjpc3juaakcyj6e","reversed":false}],"viewType":"table","visibleOptionIds":[],"visiblePropertyIds":["ae9ar615xoknd8hw8py7mbyr7zo","aysx3atqexotgwp5kx6h5i5ancw","ab6mbock6styfe6htf815ph1mhw","ao44fz8nf6z6tuj1x31t9yyehcc","a39x5cybshwrbjpc3juaakcyj6e","agqsoiipowmnu9rdwxm57zrehtr","ap4e7kdg7eip7j3c3oyiz39eaoc"]}	1679987089432	1679987089432	0	bgg9adjeykfdu9n5jrsja9ci73w	system	0	system
7ms5wci8spjrdjp3qq6ns1kc5tr	2023-03-28 07:04:49.44314+00	cdcgxou56i3yybr5tcndnj8ufba	1	image		{"fileId":"7y5kr8x8ybpnwdykjfuz57rggrh.png"}	1679987089445	1679987089445	0	bgg9adjeykfdu9n5jrsja9ci73w	system	0	system
aipt73yisntrszg4mojgtbo6gar	2023-03-28 07:04:49.456+00	cdcgxou56i3yybr5tcndnj8ufba	1	text	## Media	{}	1679987089458	1679987089458	0	bgg9adjeykfdu9n5jrsja9ci73w	system	0	system
au6egixtxrtr7fe9d4p4xphqzho	2023-03-28 07:04:49.469554+00	cff1jmrxfrirgbeebhr9qd7nida	1	text	## Research\n- ...\n- ...\n- ...\n\n## Plan\n- ...\n- ...\n- ...\n\n## Notes\n- ...\n- ...\n- ...	{}	1679987089471	1679987089471	0	bgg9adjeykfdu9n5jrsja9ci73w	system	0	system
abz8sfh7z13y6ipfxrk9d4nasoa	2023-03-28 07:04:49.481518+00	chee7jnbukbrm8n4a6983nox7za	1	text	## Research\n- ...\n- ...\n\n## Plan\n- ...\n- ...\n\n## Notes\n- ...\n- ...	{}	1679987089483	1679987089483	0	bgg9adjeykfdu9n5jrsja9ci73w	system	0	system
b78h88gsstbnfjk1tujcf6fx4ww	2023-03-28 07:04:49.508487+00		1	board	Roadmap 	{"cardProperties":[{"id":"50117d52-bcc7-4750-82aa-831a351c44a0","name":"Status","options":[{"color":"propColorGray","id":"8c557f69-b0ed-46ec-83a3-8efab9d47ef5","value":"Not Started"},{"color":"propColorYellow","id":"ec6d2bc5-df2b-4f77-8479-e59ceb039946","value":"In Progress"},{"color":"propColorGreen","id":"849766ba-56a5-48d1-886f-21672f415395","value":"Complete 🙌"}],"type":"select"},{"id":"20717ad3-5741-4416-83f1-6f133fff3d11","name":"Type","options":[{"color":"propColorYellow","id":"424ea5e3-9aa1-4075-8c5c-01b44b66e634","value":"Epic ⛰"},{"color":"propColorGreen","id":"6eea96c9-4c61-4968-8554-4b7537e8f748","value":"Task 🔨"},{"color":"propColorRed","id":"1fdbb515-edd2-4af5-80fc-437ed2211a49","value":"Bug 🐞"}],"type":"select"},{"id":"60985f46-3e41-486e-8213-2b987440ea1c","name":"Sprint","options":[{"color":"propColorBrown","id":"c01676ca-babf-4534-8be5-cce2287daa6c","value":"Sprint 1"},{"color":"propColorPurple","id":"ed4a5340-460d-461b-8838-2c56e8ee59fe","value":"Sprint 2"},{"color":"propColorBlue","id":"14892380-1a32-42dd-8034-a0cea32bc7e6","value":"Sprint 3"}],"type":"select"},{"id":"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e","name":"Priority","options":[{"color":"propColorRed","id":"cb8ecdac-38be-4d36-8712-c4d58cc8a8e9","value":"P1 🔥"},{"color":"propColorYellow","id":"e6a7f297-4440-4783-8ab3-3af5ba62ca11","value":"P2"},{"color":"propColorGray","id":"c62172ea-5da7-4dec-8186-37267d8ee9a7","value":"P3"}],"type":"select"},{"id":"aphg37f7zbpuc3bhwhp19s1ribh","name":"Assignee","options":[],"type":"person"},{"id":"a4378omyhmgj3bex13sj4wbpfiy","name":"Due Date","options":[],"type":"date"},{"id":"a36o9q1yik6nmar6ri4q4uca7ey","name":"Created Date","options":[],"type":"createdTime"},{"id":"ai7ajsdk14w7x5s8up3dwir77te","name":"Design Link","options":[],"type":"url"}],"description":"Use this template to plan your roadmap and manage your releases more efficiently.","icon":"🗺️","isTemplate":true,"showDescription":true,"templateVer":4,"trackingTemplateId":"b728c6ca730e2cfc229741c5a4712b65"}	1679987089511	1679987089511	0	b78h88gsstbnfjk1tujcf6fx4ww	system	0	system
cs6kzm7ejcfrk5coxkgj8kmez7y	2023-03-28 07:04:49.521847+00	b78h88gsstbnfjk1tujcf6fx4ww	1	card	Calendar view	{"contentOrder":["7df11783ny67mdnognqae31ax6y","af5c4op43obb7tqxudrsj3ymcxr"],"icon":"📆","isTemplate":false,"properties":{"20717ad3-5741-4416-83f1-6f133fff3d11":"6eea96c9-4c61-4968-8554-4b7537e8f748","50117d52-bcc7-4750-82aa-831a351c44a0":"849766ba-56a5-48d1-886f-21672f415395","60985f46-3e41-486e-8213-2b987440ea1c":"c01676ca-babf-4534-8be5-cce2287daa6c","ai7ajsdk14w7x5s8up3dwir77te":"https://mattermost.com/boards/","f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e":"e6a7f297-4440-4783-8ab3-3af5ba62ca11"}}	1679987089524	1679987089524	0	b78h88gsstbnfjk1tujcf6fx4ww	system	0	system
cy3nctg5wpibmzmor5poce41zey	2023-03-28 07:04:49.535416+00	b78h88gsstbnfjk1tujcf6fx4ww	1	card	Import / Export	{"contentOrder":["ac8taob8yatyminhosfzxrdigcr"],"icon":"🚢","isTemplate":false,"properties":{"20717ad3-5741-4416-83f1-6f133fff3d11":"6eea96c9-4c61-4968-8554-4b7537e8f748","50117d52-bcc7-4750-82aa-831a351c44a0":"ec6d2bc5-df2b-4f77-8479-e59ceb039946","60985f46-3e41-486e-8213-2b987440ea1c":"c01676ca-babf-4534-8be5-cce2287daa6c","ai7ajsdk14w7x5s8up3dwir77te":"https://mattermost.com/boards/","f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e":"e6a7f297-4440-4783-8ab3-3af5ba62ca11"}}	1679987089537	1679987089537	0	b78h88gsstbnfjk1tujcf6fx4ww	system	0	system
co14yqycektdm5fofehfhmcidio	2023-03-28 07:04:49.548527+00	b78h88gsstbnfjk1tujcf6fx4ww	1	card	Icons don't display	{"contentOrder":["a5qexpks9ppb1z8fosmhaai4nmw","aouab4whjb7ruxb1eo1hbe6mwba","788eckchipbb4brzk6nanuy8khh"],"icon":"💻","isTemplate":false,"properties":{"20717ad3-5741-4416-83f1-6f133fff3d11":"1fdbb515-edd2-4af5-80fc-437ed2211a49","50117d52-bcc7-4750-82aa-831a351c44a0":"8c557f69-b0ed-46ec-83a3-8efab9d47ef5","60985f46-3e41-486e-8213-2b987440ea1c":"ed4a5340-460d-461b-8838-2c56e8ee59fe","ai7ajsdk14w7x5s8up3dwir77te":"https://mattermost.com/boards/","f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e":"e6a7f297-4440-4783-8ab3-3af5ba62ca11"}}	1679987089550	1679987089550	0	b78h88gsstbnfjk1tujcf6fx4ww	system	0	system
v71ty7wtzujn39cbahqpk5po9tw	2023-03-28 07:04:49.561384+00	b78h88gsstbnfjk1tujcf6fx4ww	1	view	Board: Sprints	{"cardOrder":["cmmetesf4wfrizxrmfk1xc66fcw","cs6kzm7ejcfrk5coxkgj8kmez7y","cr4jdkhckxfyzd8p9rurgy7y6yw","co14yqycektdm5fofehfhmcidio","cy3nctg5wpibmzmor5poce41zey","c4ion7h4ir3bdunms81f7cuphjc"],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{},"defaultTemplateId":"cidz4imnqhir48brz6e8hxhfrhy","filter":{"filters":[],"operation":"and"},"groupById":"60985f46-3e41-486e-8213-2b987440ea1c","hiddenOptionIds":[],"kanbanCalculations":{},"sortOptions":[{"propertyId":"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e","reversed":false}],"viewType":"board","visibleOptionIds":["c01676ca-babf-4534-8be5-cce2287daa6c","ed4a5340-460d-461b-8838-2c56e8ee59fe","14892380-1a32-42dd-8034-a0cea32bc7e6",""],"visiblePropertyIds":["20717ad3-5741-4416-83f1-6f133fff3d11","f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e"]}	1679987089563	1679987089563	0	b78h88gsstbnfjk1tujcf6fx4ww	system	0	system
vrwjscib4n7dkmc3dxeyuyftdba	2023-03-28 07:04:49.574253+00	b78h88gsstbnfjk1tujcf6fx4ww	1	view	Board: Status	{"cardOrder":["cmmetesf4wfrizxrmfk1xc66fcw","cm4w7cc3aac6s9jdcujbs4j8f4r","c6egh6cpnj137ixdoitsoxq17oo","cct9u78utsdyotmejbmwwg66ihr","cmft87it1q7yebbd51ij9k65xbw","c9fe77j9qcruxf4itzib7ag6f1c","coup7afjknqnzbdwghiwbsq541w","c5ex1hndz8qyc8gx6ofbfeksftc"],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{},"defaultTemplateId":"cidz4imnqhir48brz6e8hxhfrhy","filter":{"filters":[],"operation":"and"},"groupById":"50117d52-bcc7-4750-82aa-831a351c44a0","hiddenOptionIds":[],"kanbanCalculations":{},"sortOptions":[{"propertyId":"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e","reversed":false}],"viewType":"board","visibleOptionIds":["8c557f69-b0ed-46ec-83a3-8efab9d47ef5","ec6d2bc5-df2b-4f77-8479-e59ceb039946","849766ba-56a5-48d1-886f-21672f415395",""],"visiblePropertyIds":["20717ad3-5741-4416-83f1-6f133fff3d11","60985f46-3e41-486e-8213-2b987440ea1c","f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e"]}	1679987089576	1679987089576	0	b78h88gsstbnfjk1tujcf6fx4ww	system	0	system
73egy4qcmc78hzfacr83dqbh1uh	2023-03-28 07:04:49.587157+00	cmmetesf4wfrizxrmfk1xc66fcw	1	image		{"fileId":"77pe9r4ckbin438ph3f18bpatua.png"}	1679987089589	1679987089589	0	b78h88gsstbnfjk1tujcf6fx4ww	system	0	system
a3stx3gaxnp8f7y4p5fjypcnj3y	2023-03-28 07:04:49.599984+00	cmmetesf4wfrizxrmfk1xc66fcw	1	text	## Screenshots\n*[If applicable, add screenshots to elaborate on the problem.]*	{}	1679987089602	1679987089602	0	b78h88gsstbnfjk1tujcf6fx4ww	system	0	system
vdkhdpp6357gz8ftb9q7k8x6c4y	2023-03-28 07:04:49.56771+00	b78h88gsstbnfjk1tujcf6fx4ww	1	view	List: Tasks 🔨	{"cardOrder":[],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{"50117d52-bcc7-4750-82aa-831a351c44a0":139,"__title":280},"defaultTemplateId":"","filter":{"filters":[{"condition":"includes","propertyId":"20717ad3-5741-4416-83f1-6f133fff3d11","values":["6eea96c9-4c61-4968-8554-4b7537e8f748"]}],"operation":"and"},"hiddenOptionIds":[],"kanbanCalculations":{},"sortOptions":[{"propertyId":"50117d52-bcc7-4750-82aa-831a351c44a0","reversed":true}],"viewType":"table","visibleOptionIds":[],"visiblePropertyIds":["50117d52-bcc7-4750-82aa-831a351c44a0","20717ad3-5741-4416-83f1-6f133fff3d11","60985f46-3e41-486e-8213-2b987440ea1c","f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e"]}	1679987089569	1679987089569	0	b78h88gsstbnfjk1tujcf6fx4ww	system	0	system
v8qt64s7dnj8t7pocdqummznnqa	2023-03-28 07:04:49.580757+00	b78h88gsstbnfjk1tujcf6fx4ww	1	view	List: Bugs 🐞	{"cardOrder":[],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{"50117d52-bcc7-4750-82aa-831a351c44a0":145,"__title":280},"defaultTemplateId":"","filter":{"filters":[{"condition":"includes","propertyId":"20717ad3-5741-4416-83f1-6f133fff3d11","values":["1fdbb515-edd2-4af5-80fc-437ed2211a49"]}],"operation":"and"},"hiddenOptionIds":[],"kanbanCalculations":{},"sortOptions":[{"propertyId":"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e","reversed":false}],"viewType":"table","visibleOptionIds":[],"visiblePropertyIds":["50117d52-bcc7-4750-82aa-831a351c44a0","20717ad3-5741-4416-83f1-6f133fff3d11","60985f46-3e41-486e-8213-2b987440ea1c","f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e"]}	1679987089583	1679987089583	0	b78h88gsstbnfjk1tujcf6fx4ww	system	0	system
aozms76o85prndfqtigkqixqame	2023-03-28 07:04:49.59334+00	cmmetesf4wfrizxrmfk1xc66fcw	1	text	## Steps to reproduce the behavior\n1. Go to ...\n2. Select  ...\n3. Scroll down to ...\n4. See error\n\n## Expected behavior\n*[A clear and concise description of what you expected to happen.]*\n\n## Edition and Platform\n- Edition: *[e.g. Personal Desktop / Personal Server / Mattermost plugin]*\n- Version: *[e.g. v0.9.0]*\n- Browser and OS: *[e.g. Chrome 91 on macOS, Edge 93 on Windows]*\n\n## Additional context\n*[Add any other context about the problem here.]*	{}	1679987089595	1679987089595	0	b78h88gsstbnfjk1tujcf6fx4ww	system	0	system
af5c4op43obb7tqxudrsj3ymcxr	2023-03-28 07:04:49.606503+00	cs6kzm7ejcfrk5coxkgj8kmez7y	1	text	## Description\n*[Brief description of this task]*\n\n## Requirements\n- *[Requirement 1]*\n- *[Requirement 2]*\n- ...	{}	1679987089608	1679987089608	0	b78h88gsstbnfjk1tujcf6fx4ww	system	0	system
7qga75o3hmfgjjkqs6mk6px5imo	2023-03-28 07:04:49.6199+00	cfefgwjke6bbxpjpig618g9bpte	1	image		{"fileId":"7pbp4qg415pbstc6enzeicnu3qh.png"}	1679987089622	1679987089622	0	b78h88gsstbnfjk1tujcf6fx4ww	system	0	system
adtm1rmkxuigedcr1idmgkrszkr	2023-03-28 07:04:49.632857+00	cfefgwjke6bbxpjpig618g9bpte	1	text	## Steps to reproduce the behavior\n\n1. Go to ...\n2. Select  ...\n3. Scroll down to ...\n4. See error\n\n## Expected behavior\n\nA clear and concise description of what you expected to happen.\n\n## Edition and Platform\n\n - Edition: Personal Desktop / Personal Server / Mattermost plugin\n - Version: [e.g. v0.9.0]\n - Browser and OS: [e.g. Chrome 91 on macOS, Edge 93 on Windows]\n\n## Additional context\n\nAdd any other context about the problem here.	{}	1679987089635	1679987089635	0	b78h88gsstbnfjk1tujcf6fx4ww	system	0	system
ac8taob8yatyminhosfzxrdigcr	2023-03-28 07:04:49.646674+00	cy3nctg5wpibmzmor5poce41zey	1	text	## Description\n*[Brief description of this task]*\n\n## Requirements\n- *[Requirement 1]*\n- *[Requirement 2]*\n- ...	{}	1679987089649	1679987089649	0	b78h88gsstbnfjk1tujcf6fx4ww	system	0	system
aunwt31xs3fbr8xkt9ou9fwk11o	2023-03-28 07:04:49.660221+00	cidz4imnqhir48brz6e8hxhfrhy	1	text	## Requirements\n- [Requirement 1]\n- [Requirement 2]\n- ...	{}	1679987089662	1679987089662	0	b78h88gsstbnfjk1tujcf6fx4ww	system	0	system
788eckchipbb4brzk6nanuy8khh	2023-03-28 07:04:49.674041+00	co14yqycektdm5fofehfhmcidio	1	image		{"fileId":"7pbp4qg415pbstc6enzeicnu3qh.png"}	1679987089676	1679987089676	0	b78h88gsstbnfjk1tujcf6fx4ww	system	0	system
a5qexpks9ppb1z8fosmhaai4nmw	2023-03-28 07:04:49.690873+00	co14yqycektdm5fofehfhmcidio	1	text	## Steps to reproduce the behavior\n1. Go to ...\n2. Select  ...\n3. Scroll down to ...\n4. See error\n\n## Expected behavior\n*[A clear and concise description of what you expected to happen.]*\n\n## Edition and Platform\n- Edition: *[e.g. Personal Desktop / Personal Server / Mattermost plugin]*\n- Version: *[e.g. v0.9.0]*\n- Browser and OS: *[e.g. Chrome 91 on macOS, Edge 93 on Windows]*\n\n## Additional context\n*[Add any other context about the problem here.]*	{}	1679987089693	1679987089693	0	b78h88gsstbnfjk1tujcf6fx4ww	system	0	system
a461wufdjair8z87pk7ope74pic	2023-03-28 07:04:49.704741+00	cwrq9ag3p5pgzzy98nfd3wwra1w	1	text	## Summary\n[Brief description of what this epic is about]\n\n## Motivation\n[Brief description on why this is needed]\n\n## Acceptance Criteria\n - [Criteron 1]\n - [Criteron 2]\n - ...\n\n## Personas\n - [Persona A]\n - [Persona B]\n - ...\n\n## Reference Materials\n - [Links to other relevant documents as needed]\n - ...	{}	1679987089706	1679987089706	0	b78h88gsstbnfjk1tujcf6fx4ww	system	0	system
cu6e93kj3ot8ddyp41nw9n6xb4c	2023-03-28 07:04:49.743188+00	bo3c5m3q7ftfi5rugbfu3mbnriy	1	card	Drag cards	{"contentOrder":["apktbgtee5jb8xrnqy3ibiujxew","a8d1k93tg57fd3cnm9f9h8wtfry"],"icon":"🤏","isTemplate":false,"properties":{"a4nfnb5xr3txr5xq7y9ho7kyz6c":"https://docs.mattermost.com/boards/working-with-boards.html#dragging-cards","a972dc7a-5f4c-45d2-8044-8c28c69717f1":"ajurey3xkocs1nwx8di5zx6oe7o","acypkejeb5yfujhj9te57p9kaxw":"aq6ukoiciyfctgwyhwzpfss8ghe"}}	1679987089745	1679987089745	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
cy49f33jeqfnjdmnkzxnfdzm1jh	2023-03-28 07:04:49.756485+00	bo3c5m3q7ftfi5rugbfu3mbnriy	1	card	Create your own board	{"contentOrder":["a5j5ibzpnitfqtywpfpjgfbg96e","anek6hsqm33bj8f9y3ygp4ghcyc","7r9my1yuddbn45dojrfht3neg8c","7eir5gdjxgjbsxpbyp3df4npcze","74kwi7z6qetycu835ykqwkxnrgh"],"icon":"📋","isTemplate":false,"properties":{"a4nfnb5xr3txr5xq7y9ho7kyz6c":"https://docs.mattermost.com/boards/working-with-boards.html#adding-new-boards","a972dc7a-5f4c-45d2-8044-8c28c69717f1":"amm6wfhnbuxojwssyftgs9dipqe","acypkejeb5yfujhj9te57p9kaxw":"aanaehcw3m13jytujsjk5hpf6ry"}}	1679987089760	1679987089760	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
cnrfkt5my4bd1tc1kr96mpswoth	2023-03-28 07:04:49.772472+00	bo3c5m3q7ftfi5rugbfu3mbnriy	1	card	Create a new card	{"contentOrder":["az5tftnjy1t8umb8tz6qgqcpfky","adhsx4h5ss7rqdcjt8xyam6xtqc","a7hsidtoz1jntdyysth1typ5srh","7me9p46gbqiyfmfnapi7dyxb5br","76czpu8dsm7f13r11z14xagb91h"],"icon":"📝","isTemplate":false,"properties":{"a4nfnb5xr3txr5xq7y9ho7kyz6c":"https://docs.mattermost.com/boards/working-with-boards.html#adding-cards","a972dc7a-5f4c-45d2-8044-8c28c69717f1":"amm6wfhnbuxojwssyftgs9dipqe","acypkejeb5yfujhj9te57p9kaxw":"aanaehcw3m13jytujsjk5hpf6ry"}}	1679987089774	1679987089774	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
c76e7ad5khfrbpdwrd886b9zm5r	2023-03-28 07:04:49.785378+00	bo3c5m3q7ftfi5rugbfu3mbnriy	1	card	Filter and sort cards	{"contentOrder":["a4fz9kcfs9ibj8puk9mux7ac94c","a4kct76f3jjye8fqt9mxaqsecca","78i8aqjmqtibr7x4okhz6uqquqr","7b8oh8crm4iymjjum64robh6ywc"],"icon":"🎛️","isTemplate":false,"properties":{"a972dc7a-5f4c-45d2-8044-8c28c69717f1":"ajurey3xkocs1nwx8di5zx6oe7o","acypkejeb5yfujhj9te57p9kaxw":"aq6ukoiciyfctgwyhwzpfss8ghe"}}	1679987089787	1679987089787	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
aiz87msricjg4bkjgrs99o44u6r	2023-03-28 07:04:49.698046+00	cwrq9ag3p5pgzzy98nfd3wwra1w	1	text	## Summary\n*[Brief description of what this epic is about]*\n## Motivation\n*[Brief description on why this is needed]*\n## Acceptance Criteria\n- *[Criteron 1]*\n- *[Criteron 2]*\n- ...\n## Personas\n- *[Persona A]*\n- *[Persona B]*\n- ...\n## Reference Materials\n- *[Links to other relevant documents as needed]*\n- ...	{}	1679987089700	1679987089700	0	b78h88gsstbnfjk1tujcf6fx4ww	system	0	system
bo3c5m3q7ftfi5rugbfu3mbnriy	2023-03-28 07:04:49.736724+00		1	board	Welcome to Boards!	{"cardProperties":[{"id":"a972dc7a-5f4c-45d2-8044-8c28c69717f1","name":"Status","options":[{"color":"propColorRed","id":"amm6wfhnbuxojwssyftgs9dipqe","value":"To do 🔥"},{"color":"propColorYellow","id":"af3p8ztcyxgn8wd9z4az7o9tjeh","value":"Next up"},{"color":"propColorPurple","id":"ajurey3xkocs1nwx8di5zx6oe7o","value":"Later"},{"color":"propColorGreen","id":"agkinkjy5983wsk6kppsujajxqw","value":"Completed 🙌"}],"type":"select"},{"id":"acypkejeb5yfujhj9te57p9kaxw","name":"Priority","options":[{"color":"propColorOrange","id":"aanaehcw3m13jytujsjk5hpf6ry","value":"1. High"},{"color":"propColorBrown","id":"ascd7nm9r491ayot8i86g1gmgqw","value":"2. Medium"},{"color":"propColorGray","id":"aq6ukoiciyfctgwyhwzpfss8ghe","value":"3. Low"}],"type":"select"},{"id":"aqh13jabwexjkzr3jqsz1i1syew","name":"Assignee","options":[],"type":"person"},{"id":"acmg7mz1rr1eykfug4hcdpb1y1o","name":"Due Date","options":[],"type":"date"},{"id":"amewjwfjrtpu8ha73xsrdmxazxr","name":"Reviewed","options":[],"type":"checkbox"},{"id":"attzzboqaz6m1sdti5xa7gjnk1e","name":"Last updated time","options":[],"type":"updatedTime"},{"id":"a4nfnb5xr3txr5xq7y9ho7kyz6c","name":"Reference","options":[],"type":"url"},{"id":"a9gzwi3dt5n55nddej6zcbhxaeh","name":"Created by","options":[],"type":"createdBy"}],"description":"Mattermost Boards is an open source project management tool that helps you organize, track, and manage work across teams. Select a card to learn more.","icon":"👋","isTemplate":true,"showDescription":true,"templateVer":4,"trackingTemplateId":"65aba997282f3ac457cd66736fb86915"}	1679987089739	1679987089739	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
cxxmymfyz8jy5zjh7ztrrzwurrw	2023-03-28 07:04:49.749292+00	bo3c5m3q7ftfi5rugbfu3mbnriy	1	card	Manage tasks with cards	{"contentOrder":["arfz9nncktin3ugxo1r4kytk33a","7io4zth6i7bnmuedkzzj1esnccr","7r9swbgsqqi81trzhkrdcffza5e","784uu3ufcgb878ky7hyugmf6xcw","7coxm5spwi78yjyh3zx3nmeqsih","7jfwnhpbb6ffa7pougdnig6usoo","7kz19ojodoi8u5kum6fa7e1zhue","7nb8y7jyoetro8cd36qcju53z8c","7bffmpsfmhtfkzfpnykb9u8iyaa","75dhykawd3ig5megxae5btokane","76nwb9tqfsid5jx46yw34itqima","7dy3mcgzgybf1ifa3emgewkzj7e","a5ca6tii33bfw8ba36y1rswq3he","7876od6xhffr6fy69zeogag7eyw","7x7bq9awkatbm5x4docbh5gaw4y","7ghpx9qff43dgtke1rwidmge1ho","7nb8y7jyoetro8cd36qcju53z8c","7hdyxemhbytfm3m83g88djq9nhr","7pgnejxokubbe9kdrxj6g9qa41e","7hw9z6qtx8jyizkmm9g5yq3gxcy","7gk6ooz6npbb8by5rgp9aig7tua","7b8xbi67z77bh8xb996omw1pipo"],"icon":"☑️","isTemplate":false,"properties":{"a4nfnb5xr3txr5xq7y9ho7kyz6c":"https://docs.mattermost.com/boards/work-with-cards.html","a972dc7a-5f4c-45d2-8044-8c28c69717f1":"amm6wfhnbuxojwssyftgs9dipqe","acypkejeb5yfujhj9te57p9kaxw":"aanaehcw3m13jytujsjk5hpf6ry"}}	1679987089751	1679987089751	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
cgbf53bt1g3byzmh6ge184mmjah	2023-03-28 07:04:49.765838+00	bo3c5m3q7ftfi5rugbfu3mbnriy	1	card	Share a board	{"contentOrder":["az8mnwbjz93dqmy1apef3mt4r3c","a8s5nabkwotystb5976io4q5dxa","7r7asyew8d7fyunf4sow8e5iyoc","ad8j3n8tp77bppee3ipjt6odgpe","7w935usqt6pby8qz9x5pxaj7iow","7ogbs8h6q4j8z7ngy1m7eag63nw","7z1jau5qy3jfcxdp5cgq3duk6ne","78a1nnh1cztb47fj7t74bownrjh"],"icon":"📤","isTemplate":false,"properties":{"a4nfnb5xr3txr5xq7y9ho7kyz6c":"https://docs.mattermost.com/boards/sharing-boards.html","a972dc7a-5f4c-45d2-8044-8c28c69717f1":"ajurey3xkocs1nwx8di5zx6oe7o","acypkejeb5yfujhj9te57p9kaxw":"aq6ukoiciyfctgwyhwzpfss8ghe"}}	1679987089768	1679987089768	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
c7edyrpyqabdapxeej435xsx47o	2023-03-28 07:04:49.778647+00	bo3c5m3q7ftfi5rugbfu3mbnriy	1	card	Share cards on Channels	{"contentOrder":["aici8woqkp7nn3nn88kzoms45we","atfx41xk1zbg4fenh3rcdgin9qa","af7564ujkhjrptd468byt14umbh","739yug5ifrbrfzqib8y93exdn8y"],"icon":"📮","isTemplate":false,"properties":{"a4nfnb5xr3txr5xq7y9ho7kyz6c":"https://docs.mattermost.com/boards/work-with-cards.html#share-card-previews","a972dc7a-5f4c-45d2-8044-8c28c69717f1":"af3p8ztcyxgn8wd9z4az7o9tjeh","acypkejeb5yfujhj9te57p9kaxw":"ascd7nm9r491ayot8i86g1gmgqw"}}	1679987089780	1679987089780	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
citptykyoit88fm5qsfg7xszihy	2023-03-28 07:04:49.792511+00	bo3c5m3q7ftfi5rugbfu3mbnriy	1	card	Create a new view	{"contentOrder":["aozbezukpgif3jpbsq7tahmmp5e","ajguxrm3gn7n98qhnhbhe5zgzzy","7owai1ux3h3gtf8byynfk6hyx1c","7n8jq1dizyfgotby3o91arf1hxh","77y4wffj1ctg7xmm9bx45qn6q6o","7w7o1f3k3ojrk3yapgdt1mwzeyh"],"icon":"👓","isTemplate":false,"properties":{"a4nfnb5xr3txr5xq7y9ho7kyz6c":"https://docs.mattermost.com/boards/working-with-boards.html#adding-new-views","a972dc7a-5f4c-45d2-8044-8c28c69717f1":"af3p8ztcyxgn8wd9z4az7o9tjeh","acypkejeb5yfujhj9te57p9kaxw":"ascd7nm9r491ayot8i86g1gmgqw"}}	1679987089795	1679987089794	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
c5fcc73fqfjrkzk7za7ifbaqg8a	2023-03-28 07:04:49.805333+00	bo3c5m3q7ftfi5rugbfu3mbnriy	1	card	@mention teammates	{"contentOrder":["aaba3kq539iymjrn3at6cfjnigo","auztpruyts7nq7xcf9uooz414da","7mbw9t71hjbrydgzgkqqaoh8usr","7gg515mdfgfnzzycihf3b381rwo"],"icon":"🔔","isTemplate":false,"properties":{"a4nfnb5xr3txr5xq7y9ho7kyz6c":"https://docs.mattermost.com/boards/work-with-cards.html#mention-people","a972dc7a-5f4c-45d2-8044-8c28c69717f1":"ajurey3xkocs1nwx8di5zx6oe7o","acypkejeb5yfujhj9te57p9kaxw":"aq6ukoiciyfctgwyhwzpfss8ghe"}}	1679987089807	1679987089807	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
vqb6snmt9x7bm7qwxyeu5fziear	2023-03-28 07:04:49.818074+00	bo3c5m3q7ftfi5rugbfu3mbnriy	1	view	Preview: Calendar View	{"cardOrder":[],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{},"dateDisplayPropertyId":"acmg7mz1rr1eykfug4hcdpb1y1o","defaultTemplateId":"","filter":{"filters":[],"operation":"and"},"hiddenOptionIds":[],"kanbanCalculations":{},"sortOptions":[],"viewType":"calendar","visibleOptionIds":[],"visiblePropertyIds":["__title"]}	1679987089820	1679987089820	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
vxzxzj3mkhfrw38w9e6f35g378c	2023-03-28 07:04:49.830468+00	bo3c5m3q7ftfi5rugbfu3mbnriy	1	view	Onboarding	{"cardOrder":["cnrfkt5my4bd1tc1kr96mpswoth","cxxmymfyz8jy5zjh7ztrrzwurrw","cy49f33jeqfnjdmnkzxnfdzm1jh","c7edyrpyqabdapxeej435xsx47o","ctrhjtasucjnuikt79m8xzumroh","citptykyoit88fm5qsfg7xszihy","c5fcc73fqfjrkzk7za7ifbaqg8a","cu6e93kj3ot8ddyp41nw9n6xb4c","cgbf53bt1g3byzmh6ge184mmjah","c76e7ad5khfrbpdwrd886b9zm5r"],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{},"defaultTemplateId":"","filter":{"filters":[],"operation":"and"},"groupById":"a972dc7a-5f4c-45d2-8044-8c28c69717f1","hiddenOptionIds":[""],"kanbanCalculations":{},"sortOptions":[],"viewType":"board","visibleOptionIds":["aqb5x3pt87dcc9stbk4ofodrpoy","a1mtm777bkagq3iuu7xo9b13qfr","auxbwzptiqzkii5r61uz3ndsy1r","aj9386k1bx8qwmepeuxg3b7z4pw"],"visiblePropertyIds":[]}	1679987089832	1679987089832	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
7coxm5spwi78yjyh3zx3nmeqsih	2023-03-28 07:04:49.843427+00	cxxmymfyz8jy5zjh7ztrrzwurrw	1	checkbox	Assign tasks to teammates	{"value":false}	1679987089845	1679987089845	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
7jfwnhpbb6ffa7pougdnig6usoo	2023-03-28 07:04:49.856433+00	cxxmymfyz8jy5zjh7ztrrzwurrw	1	checkbox	Add and update descriptions with Markdown	{"value":false}	1679987089858	1679987089858	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
ctrhjtasucjnuikt79m8xzumroh	2023-03-28 07:04:49.798819+00	bo3c5m3q7ftfi5rugbfu3mbnriy	1	card	Add new properties	{"contentOrder":["abrc6chybjfrydphtazzbt7zpmc","ayhk11qsuz789fk8bqae4oz8mro","7gc3z8cf8rirgfyutwoke9nn6jy","76cinqnb6k3dzmfbm9fnc8eofny","7npp1dsnidjbdprcp6dcjny3zbo"],"icon":"🏷️","isTemplate":false,"properties":{"a4nfnb5xr3txr5xq7y9ho7kyz6c":"https://docs.mattermost.com/boards/work-with-cards.html#add-and-manage-properties","a972dc7a-5f4c-45d2-8044-8c28c69717f1":"af3p8ztcyxgn8wd9z4az7o9tjeh","acypkejeb5yfujhj9te57p9kaxw":"ascd7nm9r491ayot8i86g1gmgqw"}}	1679987089801	1679987089801	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
vr886whugfjrn8xwb1qj4rfdegy	2023-03-28 07:04:49.811711+00	bo3c5m3q7ftfi5rugbfu3mbnriy	1	view	Preview: Table View	{"cardOrder":[],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{"__title":280,"a972dc7a-5f4c-45d2-8044-8c28c69717f1":100,"acypkejeb5yfujhj9te57p9kaxw":169},"defaultTemplateId":"","filter":{"filters":[],"operation":"and"},"hiddenOptionIds":[],"kanbanCalculations":{},"sortOptions":[],"viewType":"table","visibleOptionIds":[],"visiblePropertyIds":["a972dc7a-5f4c-45d2-8044-8c28c69717f1","aqh13jabwexjkzr3jqsz1i1syew","acmg7mz1rr1eykfug4hcdpb1y1o","acypkejeb5yfujhj9te57p9kaxw"]}	1679987089814	1679987089814	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
v5s58k3uw5jyxm8abg8q99nu19y	2023-03-28 07:04:49.824113+00	bo3c5m3q7ftfi5rugbfu3mbnriy	1	view	Preview: Gallery View	{"cardOrder":[],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{},"defaultTemplateId":"","filter":{"filters":[],"operation":"and"},"hiddenOptionIds":[],"kanbanCalculations":{},"sortOptions":[],"viewType":"gallery","visibleOptionIds":[],"visiblePropertyIds":["__title"]}	1679987089826	1679987089826	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
a8d1k93tg57fd3cnm9f9h8wtfry	2023-03-28 07:04:49.836979+00	cu6e93kj3ot8ddyp41nw9n6xb4c	1	text	Mattermost Boards makes it easy for you to update certain properties on cards through our drag and drop functionality. Simply drag this card from the **Later** column to the **Completed** column to automatically update the status and mark this task as complete.	{}	1679987089839	1679987089839	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
7b8xbi67z77bh8xb996omw1pipo	2023-03-28 07:04:49.850145+00	cxxmymfyz8jy5zjh7ztrrzwurrw	1	checkbox	Create and manage checklists, like this one... :)	{"value":false}	1679987089852	1679987089852	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
7bffmpsfmhtfkzfpnykb9u8iyaa	2023-03-28 07:04:49.863106+00	cxxmymfyz8jy5zjh7ztrrzwurrw	1	checkbox	Follow cards to get notified on the latest updates	{"value":false}	1679987089865	1679987089865	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
7kz19ojodoi8u5kum6fa7e1zhue	2023-03-28 07:04:49.876897+00	cxxmymfyz8jy5zjh7ztrrzwurrw	1	checkbox	Provide feedback and ask questions via comments	{"value":false}	1679987089879	1679987089879	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
7r9swbgsqqi81trzhkrdcffza5e	2023-03-28 07:04:49.890715+00	cxxmymfyz8jy5zjh7ztrrzwurrw	1	checkbox	Manage deadlines and milestones	{"value":false}	1679987089893	1679987089893	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
74kwi7z6qetycu835ykqwkxnrgh	2023-03-28 07:04:49.904152+00	cy49f33jeqfnjdmnkzxnfdzm1jh	1	image		{"fileId":"74uia99m9btr8peydw7oexn37tw.gif"}	1679987089906	1679987089906	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
anek6hsqm33bj8f9y3ygp4ghcyc	2023-03-28 07:04:49.916108+00	cy49f33jeqfnjdmnkzxnfdzm1jh	1	text	To create your own board, select the "+" on the top of the left hand sidebar. Choose from one of our standard templates and see how they can help you get started with your next project:\n\n- **Project Tasks**: Stay on top of your project tasks, track progress, and set priorities. \n- **Meeting Agenda**: Set your meeting agendas for recurring team meetings and 1:1s.\n- **Roadmap**: Plan your roadmap and manage your releases more efficiently.\n- **Personal Tasks**: Organize your life and track your personal tasks.\n- **Content Calendar**: Plan your editorial content, assign work, and track deadlines.\n- **Personal Goals**: Set and accomplish new personal goals and milestones.	{}	1679987089918	1679987089918	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
az8mnwbjz93dqmy1apef3mt4r3c	2023-03-28 07:04:49.928636+00	cgbf53bt1g3byzmh6ge184mmjah	1	text	Keep stakeholders and customers up-to-date on project progress by sharing your board.	{}	1679987089930	1679987089930	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
76czpu8dsm7f13r11z14xagb91h	2023-03-28 07:04:49.941394+00	cnrfkt5my4bd1tc1kr96mpswoth	1	image		{"fileId":"7iw4rxx7jj7bypmdotd9z469cyh.png"}	1679987089943	1679987089943	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
az5tftnjy1t8umb8tz6qgqcpfky	2023-03-28 07:04:49.954994+00	cnrfkt5my4bd1tc1kr96mpswoth	1	text	Mattermost Boards helps you manage and track all your project tasks with **Cards**.	{}	1679987089957	1679987089957	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
af7564ujkhjrptd468byt14umbh	2023-03-28 07:04:49.967294+00	c7edyrpyqabdapxeej435xsx47o	1	text	After you've copied the link, paste it into any channel or Direct Message to share the card. A preview of the card will display within the channel with a link back to the card on Boards.	{}	1679987089969	1679987089969	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
aici8woqkp7nn3nn88kzoms45we	2023-03-28 07:04:49.9805+00	c7edyrpyqabdapxeej435xsx47o	1	text	Cards can be linked and shared with teammates directly on Channels. Card previews are displayed when shared on Channels, so your team can discuss work items and get the relevant context without having to switch over to Boards.	{}	1679987089982	1679987089982	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
a4kct76f3jjye8fqt9mxaqsecca	2023-03-28 07:04:49.993291+00	c76e7ad5khfrbpdwrd886b9zm5r	1	text	Organize and find the cards you're looking for with our filter, sort, and grouping options. From the Board header, you can quickly toggle on different properties, change the group display, set filters, and change how the cards are sorted.	{}	1679987089995	1679987089995	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
ajguxrm3gn7n98qhnhbhe5zgzzy	2023-03-28 07:04:50.00588+00	citptykyoit88fm5qsfg7xszihy	1	text	Views allow your team to visualize the same cards and data from different perspectives, so they can stay up-to-date in the way that works best for them. To add a new view, go to **Add a new view** from the view drop-down, then select from any of the following views:\n\n- **Board**: Adds a Kanban board, similar to this one, that allows your team to organize cards in swimlanes grouped by any property of your choosing. This view helps you visualize your project progress.\n- **Table**: Displays cards in a table format with rows and columns. Use this view to get an overview of all your project tasks. Easily view and compare the state of all properties across all cards without needing to open individual cards.\n- **Gallery**: Displays cards in a gallery format, so you can manage and organize cards with image attachments.\n- **Calendar**: Adds a calendar view to easily visualize your cards by dates and keep track of deadlines.	{}	1679987090008	1679987090008	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
75dhykawd3ig5megxae5btokane	2023-03-28 07:04:49.883684+00	cxxmymfyz8jy5zjh7ztrrzwurrw	1	checkbox	@mention teammates so they can follow, and collaborate on, comments and descriptions	{"value":false}	1679987089886	1679987089886	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
arfz9nncktin3ugxo1r4kytk33a	2023-03-28 07:04:49.897517+00	cxxmymfyz8jy5zjh7ztrrzwurrw	1	text	Cards allow your entire team to manage and collaborate on a task in one place. Within a card, your team can:	{}	1679987089899	1679987089899	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
a5j5ibzpnitfqtywpfpjgfbg96e	2023-03-28 07:04:49.910143+00	cy49f33jeqfnjdmnkzxnfdzm1jh	1	text	A board helps you manage your project, organize tasks, and collaborate with your team all in one place.	{}	1679987089912	1679987089912	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
78a1nnh1cztb47fj7t74bownrjh	2023-03-28 07:04:49.922372+00	cgbf53bt1g3byzmh6ge184mmjah	1	image		{"fileId":"7knxbyuiedtdafcgmropgkrtybr.gif"}	1679987089924	1679987089924	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
a8s5nabkwotystb5976io4q5dxa	2023-03-28 07:04:49.934913+00	cgbf53bt1g3byzmh6ge184mmjah	1	text	To share a board, select **Share** at the top right of the Board view. Copy the link to share the board internally with your team or generate public link that can be accessed by anyone externally.	{}	1679987089937	1679987089937	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
a7hsidtoz1jntdyysth1typ5srh	2023-03-28 07:04:49.947992+00	cnrfkt5my4bd1tc1kr96mpswoth	1	text	To create a new card, simply do any of the following:\n- Select "**New**" on the top right header\n- Select "**+ New**" below any column\n- Select "**+**" to the right of any columnn header	{}	1679987089950	1679987089950	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
739yug5ifrbrfzqib8y93exdn8y	2023-03-28 07:04:49.961352+00	c7edyrpyqabdapxeej435xsx47o	1	image		{"fileId":"7ek6wbpp19jfoujs1goh6kttbby.gif"}	1679987089963	1679987089963	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
atfx41xk1zbg4fenh3rcdgin9qa	2023-03-28 07:04:49.973982+00	c7edyrpyqabdapxeej435xsx47o	1	text	To share a card, you'll need to copy the card link first. You can:\n\n- Open a card and select the options menu button at the top right of the card.\n- Open the board view and hover your mouse over any card to access the options menu button.	{}	1679987089976	1679987089976	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
7b8oh8crm4iymjjum64robh6ywc	2023-03-28 07:04:49.986959+00	c76e7ad5khfrbpdwrd886b9zm5r	1	image		{"fileId":"7dybb6t8fj3nrdft7nerhuf784y.png"}	1679987089989	1679987089989	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
7w7o1f3k3ojrk3yapgdt1mwzeyh	2023-03-28 07:04:49.999202+00	citptykyoit88fm5qsfg7xszihy	1	image		{"fileId":"78jws5m1myf8pufewzkaa6i11sc.gif"}	1679987090001	1679987090001	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
7npp1dsnidjbdprcp6dcjny3zbo	2023-03-28 07:04:50.012608+00	ctrhjtasucjnuikt79m8xzumroh	1	image		{"fileId":"7d6hrtig3zt8f9cnbo1um5oxx3y.gif"}	1679987090015	1679987090015	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
7gg515mdfgfnzzycihf3b381rwo	2023-03-28 07:04:50.02572+00	c5fcc73fqfjrkzk7za7ifbaqg8a	1	image		{"fileId":"74nt9eqzea3ydjjpgjtsxcjgrxc.gif"}	1679987090028	1679987090028	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
aaba3kq539iymjrn3at6cfjnigo	2023-03-28 07:04:50.038331+00	c5fcc73fqfjrkzk7za7ifbaqg8a	1	text	Collaborate with teammates directly on each card using @mentions and have all the relevant context in one place.	{}	1679987090041	1679987090041	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
abrc6chybjfrydphtazzbt7zpmc	2023-03-28 07:04:50.019458+00	ctrhjtasucjnuikt79m8xzumroh	1	text	Customize cards to fit your needs and track the information most important to you. Boards supports a wide range of fully customizable property types. For example, you can:\n- Use the **Date** property for things like deadlines or milestones.\n- Assign owners to tasks with the **Person** property.\n- Define statuses and priorities with the **Select** property.\n- Create tags with the **Multi Select** property.\n- Link cards to webpages with the **URL** property.	{}	1679987090021	1679987090021	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
auztpruyts7nq7xcf9uooz414da	2023-03-28 07:04:50.031925+00	c5fcc73fqfjrkzk7za7ifbaqg8a	1	text	To mention a teammate use the **@ symbol with their username** in the comments or description section. They'll get a Direct Message notification via Channels and also be added as a [follower](https://docs.mattermost.com/boards/work-with-cards.html#receive-updates) to the card. \n\nWhenever any changes are made to the card, they'll automatically get notified on Channels.	{}	1679987090034	1679987090034	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
\.


--
-- Data for Name: focalboard_blocks_history; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.focalboard_blocks_history (id, insert_at, parent_id, schema, type, title, fields, create_at, update_at, delete_at, root_id, modified_by, workspace_id, created_by) FROM stdin;
bdw6esspakt8mjbsftshygmfiir	2023-03-28 07:04:48.503744+00		1	board	Meeting Agenda 	{"cardProperties":[{"id":"d777ba3b-8728-40d1-87a6-59406bbbbfb0","name":"Status","options":[{"color":"propColorPink","id":"34eb9c25-d5bf-49d9-859e-f74f4e0030e7","value":"To Discuss 💬"},{"color":"propColorYellow","id":"d37a61f4-f332-4db9-8b2d-5e0a91aa20ed","value":"Revisit Later ⏳"},{"color":"propColorGreen","id":"dabadd9b-adf1-4d9f-8702-805ac6cef602","value":"Done / Archived 📦"}],"type":"select"},{"id":"4cf1568d-530f-4028-8ffd-bdc65249187e","name":"Priority","options":[{"color":"propColorRed","id":"8b05c83e-a44a-4d04-831e-97f01d8e2003","value":"1. High"},{"color":"propColorYellow","id":"b1abafbf-a038-4a19-8b68-56e0fd2319f7","value":"2. Medium"},{"color":"propColorGray","id":"2491ffaa-eb55-417b-8aff-4bd7d4136613","value":"3. Low"}],"type":"select"},{"id":"aw4w63xhet79y9gueqzzeiifdoe","name":"Created by","options":[],"type":"createdBy"},{"id":"a6ux19353xcwfqg9k1inqg5sg4w","name":"Created time","options":[],"type":"createdTime"}],"description":"Use this template for recurring meeting agendas, like team meetings and 1:1's. To use this board:\\n* Participants queue new items to discuss under \\"To Discuss\\"\\n* Go through items during the meeting\\n* Move items to Done or Revisit Later as needed","icon":"🍩","isTemplate":true,"showDescription":true,"templateVer":4,"trackingTemplateId":"54fcf9c610f0ac5e4c522c0657c90602"}	1679987088506	1679987088506	0	bdw6esspakt8mjbsftshygmfiir	system	0	system
cc9qypbmxhirypk55n55gdsgbgw	2023-03-28 07:04:48.511231+00	bdw6esspakt8mjbsftshygmfiir	1	card	Team Schedule	{"contentOrder":["a8uz114ebbjg3djyhtoo6krzzea","7153484teg38yuquwizu5b9enie","a7g3xuoxwijbajxtzi5o9n8zj4w","7a7poh44cpbg1frfky8mp1n4n4e","7aau9uhe5tfg6jnctfxmnicejjo","7iw8x53xgmf8dxmemja9ocmx65h"],"icon":"⏰","isTemplate":false,"properties":{"4cf1568d-530f-4028-8ffd-bdc65249187e":"8b05c83e-a44a-4d04-831e-97f01d8e2003","d777ba3b-8728-40d1-87a6-59406bbbbfb0":"34eb9c25-d5bf-49d9-859e-f74f4e0030e7"}}	1679987088515	1679987088515	0	bdw6esspakt8mjbsftshygmfiir	system	0	system
cozgjgqgdnjf6uyt48qxuichnac	2023-03-28 07:04:48.522211+00	bdw6esspakt8mjbsftshygmfiir	1	card	Video production	{"contentOrder":["arkznzpaw83d6d8eeqqzokag8uh","7pfrfz15am7y7fbfndi5rj44zko","au1ysitdzcir8idkxj5qe5qxxyo","71tpu6qo34fgt7xkewyuwzfmdmc","7pozhzthdrt8kpeyi3qi67fmhuo","7qb1us9k3y7dr7nywu4ssn6z4hh"],"icon":"📹","isTemplate":false,"properties":{"4cf1568d-530f-4028-8ffd-bdc65249187e":"b1abafbf-a038-4a19-8b68-56e0fd2319f7","d777ba3b-8728-40d1-87a6-59406bbbbfb0":"34eb9c25-d5bf-49d9-859e-f74f4e0030e7"}}	1679987088524	1679987088524	0	bdw6esspakt8mjbsftshygmfiir	system	0	system
carj9px87c7gmxgrmtdy3mhg71a	2023-03-28 07:04:48.528499+00	bdw6esspakt8mjbsftshygmfiir	1	card	Offsite plans	{"contentOrder":["a9gdkxmgtg38itybak6js48uooo","7gu5muczduig37f8c349esesxdr","anxkk8ostxbg9mxsqfoes6a1kua","7yom7hiena7gtbpuf7tzwe397cc","7iokb3555w7fmbd7bymgbkg1h8w","77rr5we1iffd5jgs34kpjwfggic"],"icon":"🚙","isTemplate":false,"properties":{"4cf1568d-530f-4028-8ffd-bdc65249187e":"8b05c83e-a44a-4d04-831e-97f01d8e2003","d777ba3b-8728-40d1-87a6-59406bbbbfb0":"dabadd9b-adf1-4d9f-8702-805ac6cef602"}}	1679987088530	1679987088530	0	bdw6esspakt8mjbsftshygmfiir	system	0	system
ccr6sd6ku6jff8firg93myfibsw	2023-03-28 07:04:48.535159+00	bdw6esspakt8mjbsftshygmfiir	1	card	Social Media Strategy	{"contentOrder":["aysnamtnyntr73cnudf75ds5qpo","7n7xi4a1b93y4pcsryznkbwmbcc","anyz7usbfi3fifgrzs96qi1q77o","71agschiwwiyj5rz5c67t7wbg6o","74d7awcardffg5j14iq57kkm6jw","7uu6godbu63ns5edntaaagytmma"],"icon":"🎉","isTemplate":false,"properties":{"4cf1568d-530f-4028-8ffd-bdc65249187e":"b1abafbf-a038-4a19-8b68-56e0fd2319f7","d777ba3b-8728-40d1-87a6-59406bbbbfb0":"d37a61f4-f332-4db9-8b2d-5e0a91aa20ed"}}	1679987088537	1679987088537	0	bdw6esspakt8mjbsftshygmfiir	system	0	system
vsynfx3k7u3rtzxjezep8prorfh	2023-03-28 07:04:48.541799+00	bdw6esspakt8mjbsftshygmfiir	1	view	Discussion Items	{"cardOrder":["cjpkiya33qsagr4f9hrdwhgiajc"],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{},"defaultTemplateId":"ch798q5ucefyobf5bymgqjt4f3h","filter":{"filters":[],"operation":"and"},"groupById":"d777ba3b-8728-40d1-87a6-59406bbbbfb0","hiddenOptionIds":[""],"kanbanCalculations":{},"sortOptions":[{"propertyId":"4cf1568d-530f-4028-8ffd-bdc65249187e","reversed":false}],"viewType":"board","visibleOptionIds":[],"visiblePropertyIds":["4cf1568d-530f-4028-8ffd-bdc65249187e"]}	1679987088544	1679987088544	0	bdw6esspakt8mjbsftshygmfiir	system	0	system
7aau9uhe5tfg6jnctfxmnicejjo	2023-03-28 07:04:48.547969+00	cc9qypbmxhirypk55n55gdsgbgw	1	checkbox		{"value":false}	1679987088550	1679987088550	0	bdw6esspakt8mjbsftshygmfiir	system	0	system
7a7poh44cpbg1frfky8mp1n4n4e	2023-03-28 07:04:48.554169+00	cc9qypbmxhirypk55n55gdsgbgw	1	checkbox		{"value":false}	1679987088556	1679987088556	0	bdw6esspakt8mjbsftshygmfiir	system	0	system
7153484teg38yuquwizu5b9enie	2023-03-28 07:04:48.560146+00	cc9qypbmxhirypk55n55gdsgbgw	1	divider		{}	1679987088562	1679987088562	0	bdw6esspakt8mjbsftshygmfiir	system	0	system
7iw8x53xgmf8dxmemja9ocmx65h	2023-03-28 07:04:48.566124+00	cc9qypbmxhirypk55n55gdsgbgw	1	checkbox		{"value":false}	1679987088568	1679987088568	0	bdw6esspakt8mjbsftshygmfiir	system	0	system
a8uz114ebbjg3djyhtoo6krzzea	2023-03-28 07:04:48.572071+00	cc9qypbmxhirypk55n55gdsgbgw	1	text	## Notes\n*[Add meeting notes here]*	{}	1679987088574	1679987088574	0	bdw6esspakt8mjbsftshygmfiir	system	0	system
a7g3xuoxwijbajxtzi5o9n8zj4w	2023-03-28 07:04:48.577947+00	cc9qypbmxhirypk55n55gdsgbgw	1	text	## Action Items	{}	1679987088580	1679987088580	0	bdw6esspakt8mjbsftshygmfiir	system	0	system
7fse1gir37if1bj3jxnq6wrzt5c	2023-03-28 07:04:48.58433+00	ch798q5ucefyobf5bymgqjt4f3h	1	divider		{}	1679987088586	1679987088586	0	bdw6esspakt8mjbsftshygmfiir	system	0	system
74pe3bozp3jba9k76tz7p9m7c7o	2023-03-28 07:04:48.590759+00	ch798q5ucefyobf5bymgqjt4f3h	1	checkbox		{"value":false}	1679987088593	1679987088593	0	bdw6esspakt8mjbsftshygmfiir	system	0	system
7wmc4tyoiutd5ipo89b4i6cqhnr	2023-03-28 07:04:48.597179+00	ch798q5ucefyobf5bymgqjt4f3h	1	checkbox		{"value":false}	1679987088599	1679987088599	0	bdw6esspakt8mjbsftshygmfiir	system	0	system
7jhc8pxttq7rzpxxg5dh4y177wh	2023-03-28 07:04:48.603389+00	ch798q5ucefyobf5bymgqjt4f3h	1	checkbox		{"value":false}	1679987088605	1679987088605	0	bdw6esspakt8mjbsftshygmfiir	system	0	system
axk6ucaptwbfwpn1dbuw9m5xfpo	2023-03-28 07:04:48.609595+00	ch798q5ucefyobf5bymgqjt4f3h	1	text	# Action Items	{}	1679987088611	1679987088611	0	bdw6esspakt8mjbsftshygmfiir	system	0	system
a7wjnmk476idumbpju8traadrze	2023-03-28 07:04:48.616252+00	ch798q5ucefyobf5bymgqjt4f3h	1	text	# Notes\n*[Add meeting notes here]*	{}	1679987088618	1679987088618	0	bdw6esspakt8mjbsftshygmfiir	system	0	system
7pfrfz15am7y7fbfndi5rj44zko	2023-03-28 07:04:48.622381+00	cozgjgqgdnjf6uyt48qxuichnac	1	divider		{}	1679987088624	1679987088624	0	bdw6esspakt8mjbsftshygmfiir	system	0	system
7qb1us9k3y7dr7nywu4ssn6z4hh	2023-03-28 07:04:48.628376+00	cozgjgqgdnjf6uyt48qxuichnac	1	checkbox		{"value":false}	1679987088630	1679987088630	0	bdw6esspakt8mjbsftshygmfiir	system	0	system
7pozhzthdrt8kpeyi3qi67fmhuo	2023-03-28 07:04:48.635609+00	cozgjgqgdnjf6uyt48qxuichnac	1	checkbox		{"value":false}	1679987088638	1679987088638	0	bdw6esspakt8mjbsftshygmfiir	system	0	system
71tpu6qo34fgt7xkewyuwzfmdmc	2023-03-28 07:04:48.642137+00	cozgjgqgdnjf6uyt48qxuichnac	1	checkbox		{"value":false}	1679987088644	1679987088644	0	bdw6esspakt8mjbsftshygmfiir	system	0	system
au1ysitdzcir8idkxj5qe5qxxyo	2023-03-28 07:04:48.648858+00	cozgjgqgdnjf6uyt48qxuichnac	1	text	## Action Items	{}	1679987088651	1679987088651	0	bdw6esspakt8mjbsftshygmfiir	system	0	system
7yom7hiena7gtbpuf7tzwe397cc	2023-03-28 07:04:48.662415+00	carj9px87c7gmxgrmtdy3mhg71a	1	checkbox		{"value":false}	1679987088664	1679987088664	0	bdw6esspakt8mjbsftshygmfiir	system	0	system
7gu5muczduig37f8c349esesxdr	2023-03-28 07:04:48.675376+00	carj9px87c7gmxgrmtdy3mhg71a	1	divider		{}	1679987088677	1679987088677	0	bdw6esspakt8mjbsftshygmfiir	system	0	system
anxkk8ostxbg9mxsqfoes6a1kua	2023-03-28 07:04:48.688478+00	carj9px87c7gmxgrmtdy3mhg71a	1	text	## Action Items	{}	1679987088690	1679987088690	0	bdw6esspakt8mjbsftshygmfiir	system	0	system
7n7xi4a1b93y4pcsryznkbwmbcc	2023-03-28 07:04:48.701482+00	ccr6sd6ku6jff8firg93myfibsw	1	divider		{}	1679987088703	1679987088703	0	bdw6esspakt8mjbsftshygmfiir	system	0	system
7uu6godbu63ns5edntaaagytmma	2023-03-28 07:04:48.714813+00	ccr6sd6ku6jff8firg93myfibsw	1	checkbox		{"value":false}	1679987088717	1679987088717	0	bdw6esspakt8mjbsftshygmfiir	system	0	system
anyz7usbfi3fifgrzs96qi1q77o	2023-03-28 07:04:48.727884+00	ccr6sd6ku6jff8firg93myfibsw	1	text	## Action Items	{}	1679987088730	1679987088730	0	bdw6esspakt8mjbsftshygmfiir	system	0	system
bsbuz9bn36ir4jxts68eht1wyse	2023-03-28 07:04:48.741906+00		1	board	Personal Tasks 	{"cardProperties":[{"id":"a9zf59u8x1rf4ywctpcqama7tio","name":"Occurrence","options":[{"color":"propColorBlue","id":"an51dnkenmoog9cetapbc4uyt3y","value":"Daily"},{"color":"propColorOrange","id":"afpy8s7i45frggprmfsqngsocqh","value":"Weekly"},{"color":"propColorPurple","id":"aj4jyekqqssatjcq7r7chmy19ey","value":"Monthly"}],"type":"select"},{"id":"abthng7baedhhtrwsdodeuincqy","name":"Completed","options":[],"type":"checkbox"}],"description":"Use this template to organize your life and track your personal tasks.","icon":"✔️","isTemplate":true,"showDescription":true,"templateVer":4,"trackingTemplateId":"dfb70c146a4584b8a21837477c7b5431"}	1679987088744	1679987088744	0	bsbuz9bn36ir4jxts68eht1wyse	system	0	system
c47yr59qegiyudcigxx39pkspze	2023-03-28 07:04:48.756164+00	bsbuz9bn36ir4jxts68eht1wyse	1	card	Buy groceries	{"contentOrder":["am4k7iuzbkin3ffuf9wwnr4cjtw","7k9e6i7mjyina3endyhhw4t46ko","79stg4pbs1j813cyoh6mp3yu1oo","7qba1ifkb7brfunp4noqjg56nea","7unconyyzcbb6jg3p8qpfnudodc","7nqoiciay6fytmcngnwzfiu4aky","7s5zqqra1otgttce5bkb9q3kwae"],"icon":"🛒","isTemplate":false,"properties":{"a9zf59u8x1rf4ywctpcqama7tio":"afpy8s7i45frggprmfsqngsocqh"}}	1679987088758	1679987088758	0	bsbuz9bn36ir4jxts68eht1wyse	system	0	system
cmnjh9xbs8prqmqhw91k1111q8r	2023-03-28 07:04:48.768903+00	bsbuz9bn36ir4jxts68eht1wyse	1	card	Feed Fluffy	{"contentOrder":["a3ufh1d1jctrgzjm1fmcy3x1bpe"],"icon":"🐱","isTemplate":false,"properties":{"a9zf59u8x1rf4ywctpcqama7tio":"an51dnkenmoog9cetapbc4uyt3y"}}	1679987088771	1679987088771	0	bsbuz9bn36ir4jxts68eht1wyse	system	0	system
vcdt6738eotfq9jra7up74fusyw	2023-03-28 07:04:48.78127+00	bsbuz9bn36ir4jxts68eht1wyse	1	view	List View	{"cardOrder":[],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{"__title":280},"defaultTemplateId":"","filter":{"filters":[],"operation":"and"},"hiddenOptionIds":[],"kanbanCalculations":{},"sortOptions":[],"viewType":"table","visibleOptionIds":[],"visiblePropertyIds":["a9zf59u8x1rf4ywctpcqama7tio","abthng7baedhhtrwsdodeuincqy"]}	1679987088783	1679987088783	0	bsbuz9bn36ir4jxts68eht1wyse	system	0	system
7zmik5dnrhpgrpcnxd8i6gnomza	2023-03-28 07:04:48.794187+00	c8cmwys1w1brtxyxku3ztjkz9ge	1	checkbox	Utilities	{"value":true}	1679987088796	1679987088796	0	bsbuz9bn36ir4jxts68eht1wyse	system	0	system
7owsytsdnybrcueaf3i7s861bmr	2023-03-28 07:04:48.806456+00	c8cmwys1w1brtxyxku3ztjkz9ge	1	checkbox	Internet	{"value":true}	1679987088808	1679987088808	0	bsbuz9bn36ir4jxts68eht1wyse	system	0	system
7unconyyzcbb6jg3p8qpfnudodc	2023-03-28 07:04:48.81848+00	c47yr59qegiyudcigxx39pkspze	1	checkbox	Butter	{"value":false}	1679987088820	1679987088820	0	bsbuz9bn36ir4jxts68eht1wyse	system	0	system
7k9e6i7mjyina3endyhhw4t46ko	2023-03-28 07:04:48.831245+00	c47yr59qegiyudcigxx39pkspze	1	checkbox	Milk	{"value":false}	1679987088833	1679987088833	0	bsbuz9bn36ir4jxts68eht1wyse	system	0	system
79stg4pbs1j813cyoh6mp3yu1oo	2023-03-28 07:04:48.843678+00	c47yr59qegiyudcigxx39pkspze	1	checkbox	Eggs	{"value":false}	1679987088845	1679987088845	0	bsbuz9bn36ir4jxts68eht1wyse	system	0	system
7qz5cp7gediy1tj6azbqipi1r7a	2023-03-28 07:04:48.85695+00	cc7tu3c8ywty9ibsr453eqk58ja	1	image		{"fileId":"76fwrj36hptg6dywka4k5mt3sph.png"}	1679987088859	1679987088859	0	bsbuz9bn36ir4jxts68eht1wyse	system	0	system
awcys3dpgftby8exkqgz81j5oho	2023-03-28 07:04:48.869783+00	cc7tu3c8ywty9ibsr453eqk58ja	1	text	## Route	{}	1679987088872	1679987088872	0	bsbuz9bn36ir4jxts68eht1wyse	system	0	system
bg5bjah1fmbbs3eedts6kfdaneo	2023-03-28 07:04:48.987673+00		1	board	Project Tasks 	{"cardProperties":[{"id":"a972dc7a-5f4c-45d2-8044-8c28c69717f1","name":"Status","options":[{"color":"propColorBlue","id":"ayz81h9f3dwp7rzzbdebesc7ute","value":"Not Started"},{"color":"propColorYellow","id":"ar6b8m3jxr3asyxhr8iucdbo6yc","value":"In Progress"},{"color":"propColorRed","id":"afi4o5nhnqc3smtzs1hs3ij34dh","value":"Blocked"},{"color":"propColorGreen","id":"adeo5xuwne3qjue83fcozekz8ko","value":"Completed 🙌"},{"color":"propColorBrown","id":"ahpyxfnnrzynsw3im1psxpkgtpe","value":"Archived"}],"type":"select"},{"id":"d3d682bf-e074-49d9-8df5-7320921c2d23","name":"Priority","options":[{"color":"propColorRed","id":"d3bfb50f-f569-4bad-8a3a-dd15c3f60101","value":"1. High 🔥"},{"color":"propColorYellow","id":"87f59784-b859-4c24-8ebe-17c766e081dd","value":"2. Medium"},{"color":"propColorGray","id":"98a57627-0f76-471d-850d-91f3ed9fd213","value":"3. Low"}],"type":"select"},{"id":"axkhqa4jxr3jcqe4k87g8bhmary","name":"Assignee","options":[],"type":"person"},{"id":"a8daz81s4xjgke1ww6cwik5w7ye","name":"Estimated Hours","options":[],"type":"number"},{"id":"a3zsw7xs8sxy7atj8b6totp3mby","name":"Due Date","options":[],"type":"date"},{"id":"a7gdnz8ff8iyuqmzddjgmgo9ery","name":"Created By","options":[],"type":"createdBy"},{"id":"2a5da320-735c-4093-8787-f56e15cdfeed","name":"Date Created","options":[],"type":"createdTime"}],"description":"Use this template to stay on top of your project tasks and progress.","icon":"🎯","isTemplate":true,"showDescription":true,"templateVer":4,"trackingTemplateId":"a4ec399ab4f2088b1051c3cdf1dde4c3"}	1679987088990	1679987088990	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
cg3yoxg6e57gezydi4ekjneqear	2023-03-28 07:04:49.000803+00	bg5bjah1fmbbs3eedts6kfdaneo	1	card	Define project scope	{"contentOrder":["adk1hkaoguprfmfdgumdy795n6o","71b5y8bjaztbrue6uabw5fuud9r","a61nrrxockbdwur6uemcqqfcisy","7qo79dfad8fdsim1n547841w9na","7xz41ryoukfru9p8j6aa187wbdo","7acqmra67eiyuj8xhwk36kd6y3r","71i1847jqyf868m3ahm1ntu3ipo"],"icon":"🔬","isTemplate":false,"properties":{"a8daz81s4xjgke1ww6cwik5w7ye":"32","a972dc7a-5f4c-45d2-8044-8c28c69717f1":"ar6b8m3jxr3asyxhr8iucdbo6yc","d3d682bf-e074-49d9-8df5-7320921c2d23":"87f59784-b859-4c24-8ebe-17c766e081dd"}}	1679987089003	1679987089003	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
ahdsmycz5c3nbz8pcrux1ctiw4y	2023-03-28 07:04:49.667514+00	c4ion7h4ir3bdunms81f7cuphjc	1	text	## Summary\n*[Brief description of what this epic is about]*\n\n## Motivation\n*[Brief description on why this is needed]*\n\n## Acceptance Criteria\n - *[Criteron 1]*\n - *[Criteron 2]*\n - ...\n\n## Personas\n - *[Persona A]*\n - *[Persona B]*\n - ...\n\n## Reference Materials\n - *[Links to other relevant documents as needed]*\n - ...	{}	1679987089669	1679987089669	0	b78h88gsstbnfjk1tujcf6fx4ww	system	0	system
arkznzpaw83d6d8eeqqzokag8uh	2023-03-28 07:04:48.655792+00	cozgjgqgdnjf6uyt48qxuichnac	1	text	## Notes\n*[Add meeting notes here]*	{}	1679987088658	1679987088658	0	bdw6esspakt8mjbsftshygmfiir	system	0	system
7iokb3555w7fmbd7bymgbkg1h8w	2023-03-28 07:04:48.668725+00	carj9px87c7gmxgrmtdy3mhg71a	1	checkbox		{"value":false}	1679987088671	1679987088671	0	bdw6esspakt8mjbsftshygmfiir	system	0	system
77rr5we1iffd5jgs34kpjwfggic	2023-03-28 07:04:48.681943+00	carj9px87c7gmxgrmtdy3mhg71a	1	checkbox		{"value":false}	1679987088684	1679987088684	0	bdw6esspakt8mjbsftshygmfiir	system	0	system
a9gdkxmgtg38itybak6js48uooo	2023-03-28 07:04:48.69513+00	carj9px87c7gmxgrmtdy3mhg71a	1	text	## Notes\n*[Add meeting notes here]*	{}	1679987088697	1679987088697	0	bdw6esspakt8mjbsftshygmfiir	system	0	system
74d7awcardffg5j14iq57kkm6jw	2023-03-28 07:04:48.707802+00	ccr6sd6ku6jff8firg93myfibsw	1	checkbox		{"value":false}	1679987088710	1679987088710	0	bdw6esspakt8mjbsftshygmfiir	system	0	system
71agschiwwiyj5rz5c67t7wbg6o	2023-03-28 07:04:48.721293+00	ccr6sd6ku6jff8firg93myfibsw	1	checkbox		{"value":false}	1679987088723	1679987088723	0	bdw6esspakt8mjbsftshygmfiir	system	0	system
aysnamtnyntr73cnudf75ds5qpo	2023-03-28 07:04:48.734382+00	ccr6sd6ku6jff8firg93myfibsw	1	text	## Notes\n*[Add meeting notes here]*	{}	1679987088736	1679987088736	0	bdw6esspakt8mjbsftshygmfiir	system	0	system
c8cmwys1w1brtxyxku3ztjkz9ge	2023-03-28 07:04:48.749326+00	bsbuz9bn36ir4jxts68eht1wyse	1	card	Pay bills	{"contentOrder":["7uww5tmxg1tbu8yc454guujudac","7owsytsdnybrcueaf3i7s861bmr","7zmik5dnrhpgrpcnxd8i6gnomza"],"icon":"🔌","isTemplate":false,"properties":{"a9zf59u8x1rf4ywctpcqama7tio":"aj4jyekqqssatjcq7r7chmy19ey","abthng7baedhhtrwsdodeuincqy":"true"}}	1679987088751	1679987088751	0	bsbuz9bn36ir4jxts68eht1wyse	system	0	system
cc7tu3c8ywty9ibsr453eqk58ja	2023-03-28 07:04:48.76266+00	bsbuz9bn36ir4jxts68eht1wyse	1	card	Go for a walk	{"contentOrder":["au1u647azq3b9ijzjb5im435keo","awcys3dpgftby8exkqgz81j5oho","7qz5cp7gediy1tj6azbqipi1r7a"],"icon":"👣","isTemplate":false,"properties":{"a9zf59u8x1rf4ywctpcqama7tio":"an51dnkenmoog9cetapbc4uyt3y"}}	1679987088764	1679987088764	0	bsbuz9bn36ir4jxts68eht1wyse	system	0	system
cq71o3aowyfbsjdrtaidho5fqoe	2023-03-28 07:04:48.775446+00	bsbuz9bn36ir4jxts68eht1wyse	1	card	Gardening	{"contentOrder":[],"icon":"🌳","isTemplate":false,"properties":{"a9zf59u8x1rf4ywctpcqama7tio":"afpy8s7i45frggprmfsqngsocqh"}}	1679987088777	1679987088777	0	bsbuz9bn36ir4jxts68eht1wyse	system	0	system
vwmx1p1fhm3y9meehhpgurn5gxy	2023-03-28 07:04:48.787747+00	bsbuz9bn36ir4jxts68eht1wyse	1	view	Board View	{"cardOrder":["c47yr59qegiyudcigxx39pkspze","c8cmwys1w1brtxyxku3ztjkz9ge","cc7tu3c8ywty9ibsr453eqk58ja","cmnjh9xbs8prqmqhw91k1111q8r","czowhma7rnpgb3eczbqo3t7fijo"],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{},"defaultTemplateId":"cidrrzojxpfroicutox1hoyk91h","filter":{"filters":[],"operation":"and"},"groupById":"a9zf59u8x1rf4ywctpcqama7tio","hiddenOptionIds":[],"kanbanCalculations":{},"sortOptions":[],"viewType":"board","visibleOptionIds":["an51dnkenmoog9cetapbc4uyt3y","afpy8s7i45frggprmfsqngsocqh","aj4jyekqqssatjcq7r7chmy19ey",""],"visiblePropertyIds":["a9zf59u8x1rf4ywctpcqama7tio"]}	1679987088790	1679987088790	0	bsbuz9bn36ir4jxts68eht1wyse	system	0	system
7uww5tmxg1tbu8yc454guujudac	2023-03-28 07:04:48.800233+00	c8cmwys1w1brtxyxku3ztjkz9ge	1	checkbox	Mobile phone	{"value":true}	1679987088802	1679987088802	0	bsbuz9bn36ir4jxts68eht1wyse	system	0	system
7nqoiciay6fytmcngnwzfiu4aky	2023-03-28 07:04:48.812401+00	c47yr59qegiyudcigxx39pkspze	1	checkbox	Cereal	{"value":false}	1679987088814	1679987088814	0	bsbuz9bn36ir4jxts68eht1wyse	system	0	system
7qba1ifkb7brfunp4noqjg56nea	2023-03-28 07:04:48.82477+00	c47yr59qegiyudcigxx39pkspze	1	checkbox	Bread	{"value":false}	1679987088826	1679987088826	0	bsbuz9bn36ir4jxts68eht1wyse	system	0	system
7s5zqqra1otgttce5bkb9q3kwae	2023-03-28 07:04:48.837281+00	c47yr59qegiyudcigxx39pkspze	1	checkbox	Bananas	{"value":false}	1679987088839	1679987088839	0	bsbuz9bn36ir4jxts68eht1wyse	system	0	system
am4k7iuzbkin3ffuf9wwnr4cjtw	2023-03-28 07:04:48.850216+00	c47yr59qegiyudcigxx39pkspze	1	text	## Grocery list	{}	1679987088852	1679987088852	0	bsbuz9bn36ir4jxts68eht1wyse	system	0	system
au1u647azq3b9ijzjb5im435keo	2023-03-28 07:04:48.863302+00	cc7tu3c8ywty9ibsr453eqk58ja	1	text	## Goal\nWalk at least 10,000 steps every day.	{}	1679987088865	1679987088865	0	bsbuz9bn36ir4jxts68eht1wyse	system	0	system
a3ufh1d1jctrgzjm1fmcy3x1bpe	2023-03-28 07:04:48.87631+00	cmnjh9xbs8prqmqhw91k1111q8r	1	text		{}	1679987088878	1679987088878	0	bsbuz9bn36ir4jxts68eht1wyse	system	0	system
cxefo1ynaufbcdg58xj8yxuqo5h	2023-03-28 07:04:48.994605+00	bg5bjah1fmbbs3eedts6kfdaneo	1	card	Identify dependencies	{"contentOrder":["ap7w8cit3m3yyprkxikifbqamqa","7cxbaqnw6h7r9ffuc13m9poqdfa","a7qxjz8y5ofbnxcebkze94piwgr","7b3yazurtpffnbkw1t6xdiiycxr","7to1gfx6sbbnc7qzbhixui9jtgh","7nu9wd3mcrf8adfh195b1hwdzsr","7tkkzqmp8jibbjk33uuqnoxqnha"],"icon":"🔗","isTemplate":false,"properties":{"a8daz81s4xjgke1ww6cwik5w7ye":"16","a972dc7a-5f4c-45d2-8044-8c28c69717f1":"ayz81h9f3dwp7rzzbdebesc7ute","d3d682bf-e074-49d9-8df5-7320921c2d23":"98a57627-0f76-471d-850d-91f3ed9fd213"}}	1679987088997	1679987088997	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
cgk4i5eftp3bobcrykxmkhmhghe	2023-03-28 07:04:49.007491+00	bg5bjah1fmbbs3eedts6kfdaneo	1	card	Requirements sign-off	{"contentOrder":["a6ob8dqnmxf8ziddrrtaig4d8xa","7dbxxuoghkfrbtqro16k8myo1ue","atfmcuwgfu7nqik5yb5xkuy6bsw","7b6pns5chnigfimfsr58tnej5na","7667eaai5x3r9pqk8xiq5js567w","7fcsi7gk71bywxkj89mgbok71gh","7duodx8p65bbxujmcnt8xfpmndr"],"icon":"🖋️","isTemplate":false,"properties":{"a8daz81s4xjgke1ww6cwik5w7ye":"8","a972dc7a-5f4c-45d2-8044-8c28c69717f1":"ayz81h9f3dwp7rzzbdebesc7ute","d3d682bf-e074-49d9-8df5-7320921c2d23":"d3bfb50f-f569-4bad-8a3a-dd15c3f60101"}}	1679987089009	1679987089009	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
cig74rakze7nrtqdjif583pk16e	2023-03-28 07:04:49.019918+00	bg5bjah1fmbbs3eedts6kfdaneo	1	card	Conduct market analysis	{"contentOrder":["aurx9e7r5atyt9kasnq9jtsbjfo","7bdfjw1o9q78dmgs7jg7jxucrxa","agaxxygwyz7gb9ema3swxu8cich","7y9ue53xgxby38fbecdumn594ew","7a3daxfsy8irw9pfjgpqyij6cwh","7ywg3epcrcfrhtmgftuwae9pntr","7t9gnhnjg4fnjfethy4a84tdb7e"],"icon":"📈","isTemplate":false,"properties":{"a8daz81s4xjgke1ww6cwik5w7ye":"40","a972dc7a-5f4c-45d2-8044-8c28c69717f1":"ar6b8m3jxr3asyxhr8iucdbo6yc","d3d682bf-e074-49d9-8df5-7320921c2d23":"87f59784-b859-4c24-8ebe-17c766e081dd"}}	1679987089022	1679987089022	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
vnuq8tsbe1b8cf8a1dn4cq46xkc	2023-03-28 07:04:49.352871+00	be9zqbr58efnozm9tiriq1gfyww	1	view	By Status	{"cardOrder":[],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{},"defaultTemplateId":"","filter":{"filters":[],"operation":"and"},"groupById":"af6fcbb8-ca56-4b73-83eb-37437b9a667d","hiddenOptionIds":[],"kanbanCalculations":{},"sortOptions":[],"viewType":"board","visibleOptionIds":["bf52bfe6-ac4c-4948-821f-83eaa1c7b04a","77c539af-309c-4db1-8329-d20ef7e9eacd","98bdea27-0cce-4cde-8dc6-212add36e63a",""],"visiblePropertyIds":["d9725d14-d5a8-48e5-8de1-6f8c004a9680","d6b1249b-bc18-45fc-889e-bec48fce80ef"]}	1679987089355	1679987089355	0	be9zqbr58efnozm9tiriq1gfyww	system	0	system
aouab4whjb7ruxb1eo1hbe6mwba	2023-03-28 07:04:49.680539+00	co14yqycektdm5fofehfhmcidio	1	text	## Screenshots\n*[If applicable, add screenshots to elaborate on the problem.]*	{}	1679987089682	1679987089682	0	b78h88gsstbnfjk1tujcf6fx4ww	system	0	system
cn1xgzc5nzbgk5b7fmj1wkuw5zo	2023-03-28 07:04:49.013426+00	bg5bjah1fmbbs3eedts6kfdaneo	1	card	Project budget approval	{"contentOrder":["a9n14dsjw7pd9df9gnoxunsow9o","7t1rrscn8qbd3ddjk6k8mbwyreo","ak9kfj7imnp8a5qdezn8cgsz9dr","7i1wi88x7tfyn8c78wzic7gzrmo","7a3ukge8xxiddt8s9xh9ujizyzh","745qbcks3ubnrmdfi5n55afegka","7pacbuqepd7b9xkostj7wp6apew"],"icon":"💵","isTemplate":false,"properties":{"a8daz81s4xjgke1ww6cwik5w7ye":"16","a972dc7a-5f4c-45d2-8044-8c28c69717f1":"ayz81h9f3dwp7rzzbdebesc7ute","d3d682bf-e074-49d9-8df5-7320921c2d23":"d3bfb50f-f569-4bad-8a3a-dd15c3f60101"}}	1679987089015	1679987089015	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
vyarnnh4787rp9eyjpyrouok76h	2023-03-28 07:04:49.02575+00	bg5bjah1fmbbs3eedts6kfdaneo	1	view	Project Priorities	{"cardOrder":[],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{},"defaultTemplateId":"","filter":{"filters":[],"operation":"and"},"groupById":"d3d682bf-e074-49d9-8df5-7320921c2d23","hiddenOptionIds":[],"kanbanCalculations":{"":{"calculation":"sum","propertyId":"a8daz81s4xjgke1ww6cwik5w7ye"},"87f59784-b859-4c24-8ebe-17c766e081dd":{"calculation":"sum","propertyId":"a8daz81s4xjgke1ww6cwik5w7ye"},"98a57627-0f76-471d-850d-91f3ed9fd213":{"calculation":"sum","propertyId":"a8daz81s4xjgke1ww6cwik5w7ye"},"d3bfb50f-f569-4bad-8a3a-dd15c3f60101":{"calculation":"sum","propertyId":"a8daz81s4xjgke1ww6cwik5w7ye"}},"sortOptions":[],"viewType":"board","visibleOptionIds":["d3bfb50f-f569-4bad-8a3a-dd15c3f60101","87f59784-b859-4c24-8ebe-17c766e081dd","98a57627-0f76-471d-850d-91f3ed9fd213",""],"visiblePropertyIds":["a972dc7a-5f4c-45d2-8044-8c28c69717f1","a8daz81s4xjgke1ww6cwik5w7ye"]}	1679987089028	1679987089028	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
vfpnoehdw87b13quq4rji8ync9r	2023-03-28 07:04:49.038645+00	bg5bjah1fmbbs3eedts6kfdaneo	1	view	Task Overview	{"cardOrder":["cg3yoxg6e57gezydi4ekjneqear","cig74rakze7nrtqdjif583pk16e","cxefo1ynaufbcdg58xj8yxuqo5h","cn1xgzc5nzbgk5b7fmj1wkuw5zo","cgk4i5eftp3bobcrykxmkhmhghe","cz8p8gofakfby8kzz83j97db8ph","ce1jm5q5i54enhuu4h3kkay1hcc"],"collapsedOptionIds":[],"columnCalculations":{"a8daz81s4xjgke1ww6cwik5w7ye":"sum"},"columnWidths":{"2a5da320-735c-4093-8787-f56e15cdfeed":196,"__title":280,"a8daz81s4xjgke1ww6cwik5w7ye":139,"a972dc7a-5f4c-45d2-8044-8c28c69717f1":141,"d3d682bf-e074-49d9-8df5-7320921c2d23":110},"defaultTemplateId":"czw9es1e89fdpjr7cqptr1xq7qh","filter":{"filters":[],"operation":"and"},"groupById":"","hiddenOptionIds":[],"kanbanCalculations":{},"sortOptions":[],"viewType":"table","visibleOptionIds":[],"visiblePropertyIds":["a972dc7a-5f4c-45d2-8044-8c28c69717f1","d3d682bf-e074-49d9-8df5-7320921c2d23","2a5da320-735c-4093-8787-f56e15cdfeed","a3zsw7xs8sxy7atj8b6totp3mby","axkhqa4jxr3jcqe4k87g8bhmary","a7gdnz8ff8iyuqmzddjgmgo9ery","a8daz81s4xjgke1ww6cwik5w7ye"]}	1679987089041	1679987089041	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
7b3yazurtpffnbkw1t6xdiiycxr	2023-03-28 07:04:49.051558+00	cxefo1ynaufbcdg58xj8yxuqo5h	1	checkbox	[Subtask 1]	{"value":false}	1679987089053	1679987089053	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
7cxbaqnw6h7r9ffuc13m9poqdfa	2023-03-28 07:04:49.064286+00	cxefo1ynaufbcdg58xj8yxuqo5h	1	divider		{}	1679987089066	1679987089066	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
7nu9wd3mcrf8adfh195b1hwdzsr	2023-03-28 07:04:49.077152+00	cxefo1ynaufbcdg58xj8yxuqo5h	1	checkbox	[Subtask 3]	{"value":false}	1679987089079	1679987089079	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
ap7w8cit3m3yyprkxikifbqamqa	2023-03-28 07:04:49.090208+00	cxefo1ynaufbcdg58xj8yxuqo5h	1	text	## Description\n*[Brief description of this task]*	{}	1679987089092	1679987089092	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
71i1847jqyf868m3ahm1ntu3ipo	2023-03-28 07:04:49.102917+00	cg3yoxg6e57gezydi4ekjneqear	1	checkbox	...	{"value":false}	1679987089105	1679987089105	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
7acqmra67eiyuj8xhwk36kd6y3r	2023-03-28 07:04:49.115152+00	cg3yoxg6e57gezydi4ekjneqear	1	checkbox	[Subtask 3]	{"value":false}	1679987089117	1679987089117	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
a61nrrxockbdwur6uemcqqfcisy	2023-03-28 07:04:49.127531+00	cg3yoxg6e57gezydi4ekjneqear	1	text	## Checklist	{}	1679987089129	1679987089129	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
7duodx8p65bbxujmcnt8xfpmndr	2023-03-28 07:04:49.139916+00	cgk4i5eftp3bobcrykxmkhmhghe	1	checkbox	...	{"value":false}	1679987089142	1679987089142	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
7dbxxuoghkfrbtqro16k8myo1ue	2023-03-28 07:04:49.153814+00	cgk4i5eftp3bobcrykxmkhmhghe	1	divider		{}	1679987089156	1679987089156	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
7b6pns5chnigfimfsr58tnej5na	2023-03-28 07:04:49.167107+00	cgk4i5eftp3bobcrykxmkhmhghe	1	checkbox	[Subtask 1]	{"value":false}	1679987089169	1679987089169	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
atfmcuwgfu7nqik5yb5xkuy6bsw	2023-03-28 07:04:49.180295+00	cgk4i5eftp3bobcrykxmkhmhghe	1	text	## Checklist	{}	1679987089182	1679987089182	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
7i1wi88x7tfyn8c78wzic7gzrmo	2023-03-28 07:04:49.193443+00	cn1xgzc5nzbgk5b7fmj1wkuw5zo	1	checkbox	[Subtask 1]	{"value":false}	1679987089195	1679987089195	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
7pacbuqepd7b9xkostj7wp6apew	2023-03-28 07:04:49.206235+00	cn1xgzc5nzbgk5b7fmj1wkuw5zo	1	checkbox	...	{"value":false}	1679987089208	1679987089208	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
ak9kfj7imnp8a5qdezn8cgsz9dr	2023-03-28 07:04:49.21878+00	cn1xgzc5nzbgk5b7fmj1wkuw5zo	1	text	## Checklist	{}	1679987089220	1679987089220	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
7t9gnhnjg4fnjfethy4a84tdb7e	2023-03-28 07:04:49.231491+00	cig74rakze7nrtqdjif583pk16e	1	checkbox	...	{"value":false}	1679987089233	1679987089233	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
7bdfjw1o9q78dmgs7jg7jxucrxa	2023-03-28 07:04:49.243837+00	cig74rakze7nrtqdjif583pk16e	1	divider		{}	1679987089246	1679987089246	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
7y9ue53xgxby38fbecdumn594ew	2023-03-28 07:04:49.256425+00	cig74rakze7nrtqdjif583pk16e	1	checkbox	[Subtask 1]	{"value":false}	1679987089258	1679987089258	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
agaxxygwyz7gb9ema3swxu8cich	2023-03-28 07:04:49.268951+00	cig74rakze7nrtqdjif583pk16e	1	text	## Checklist	{}	1679987089271	1679987089271	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
7nsdcqg8oqf89zeyid98d7xhnyy	2023-03-28 07:04:49.281188+00	czw9es1e89fdpjr7cqptr1xq7qh	1	checkbox	[Subtask 2]	{"value":false}	1679987089283	1679987089283	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
7a1b1rsbb5bdjjdasd9yun6ssyo	2023-03-28 07:04:49.294065+00	czw9es1e89fdpjr7cqptr1xq7qh	1	checkbox	[Subtask 1]	{"value":false}	1679987089296	1679987089296	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
ajkazoofbpigbiro6in7bwpa3iw	2023-03-28 07:04:49.306864+00	czw9es1e89fdpjr7cqptr1xq7qh	1	text	## Description\n*[Brief description of this task]*	{}	1679987089309	1679987089309	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
axwwxncix8fd5dpp1c3chkdogsa	2023-03-28 07:04:49.61347+00	cr4jdkhckxfyzd8p9rurgy7y6yw	1	text	## Description\n*[Brief description of this task]*\n\n## Requirements\n- *[Requirement 1]*\n- *[Requirement 2]*\n- ...	{}	1679987089615	1679987089615	0	b78h88gsstbnfjk1tujcf6fx4ww	system	0	system
amdhndujcqpyd9g1oeehn7xs7ae	2023-03-28 07:04:49.626129+00	cfefgwjke6bbxpjpig618g9bpte	1	text	## Screenshots\nIf applicable, add screenshots to elaborate on the problem.	{}	1679987089628	1679987089628	0	b78h88gsstbnfjk1tujcf6fx4ww	system	0	system
vihztm13ocp8mdjnddmzcwrtc9o	2023-03-28 07:04:49.032111+00	bg5bjah1fmbbs3eedts6kfdaneo	1	view	Progress Tracker	{"cardOrder":["cn1xgzc5nzbgk5b7fmj1wkuw5zo","cgk4i5eftp3bobcrykxmkhmhghe","cxefo1ynaufbcdg58xj8yxuqo5h","cig74rakze7nrtqdjif583pk16e","cg3yoxg6e57gezydi4ekjneqear","coxnjt3ro1in19dd1e3awdt338r"],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{},"defaultTemplateId":"czw9es1e89fdpjr7cqptr1xq7qh","filter":{"filters":[],"operation":"and"},"groupById":"a972dc7a-5f4c-45d2-8044-8c28c69717f1","hiddenOptionIds":[],"kanbanCalculations":{"":{"calculation":"sum","propertyId":"a8daz81s4xjgke1ww6cwik5w7ye"},"adeo5xuwne3qjue83fcozekz8ko":{"calculation":"sum","propertyId":"a8daz81s4xjgke1ww6cwik5w7ye"},"afi4o5nhnqc3smtzs1hs3ij34dh":{"calculation":"sum","propertyId":"a8daz81s4xjgke1ww6cwik5w7ye"},"ahpyxfnnrzynsw3im1psxpkgtpe":{"calculation":"sum","propertyId":"a8daz81s4xjgke1ww6cwik5w7ye"},"ar6b8m3jxr3asyxhr8iucdbo6yc":{"calculation":"sum","propertyId":"a8daz81s4xjgke1ww6cwik5w7ye"},"ayz81h9f3dwp7rzzbdebesc7ute":{"calculation":"sum","propertyId":"a8daz81s4xjgke1ww6cwik5w7ye"}},"sortOptions":[],"viewType":"board","visibleOptionIds":["ayz81h9f3dwp7rzzbdebesc7ute","ar6b8m3jxr3asyxhr8iucdbo6yc","afi4o5nhnqc3smtzs1hs3ij34dh","adeo5xuwne3qjue83fcozekz8ko","ahpyxfnnrzynsw3im1psxpkgtpe",""],"visiblePropertyIds":["d3d682bf-e074-49d9-8df5-7320921c2d23","a8daz81s4xjgke1ww6cwik5w7ye"]}	1679987089034	1679987089034	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
v46esh4fz13yn5ebkxidzkqcnsa	2023-03-28 07:04:49.045355+00	bg5bjah1fmbbs3eedts6kfdaneo	1	view	Task Calendar	{"cardOrder":[],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{},"dateDisplayPropertyId":"a3zsw7xs8sxy7atj8b6totp3mby","defaultTemplateId":"","filter":{"filters":[],"operation":"and"},"hiddenOptionIds":[],"kanbanCalculations":{},"sortOptions":[],"viewType":"calendar","visibleOptionIds":[],"visiblePropertyIds":["__title"]}	1679987089047	1679987089047	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
7to1gfx6sbbnc7qzbhixui9jtgh	2023-03-28 07:04:49.058033+00	cxefo1ynaufbcdg58xj8yxuqo5h	1	checkbox	[Subtask 2]	{"value":false}	1679987089060	1679987089060	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
7tkkzqmp8jibbjk33uuqnoxqnha	2023-03-28 07:04:49.070735+00	cxefo1ynaufbcdg58xj8yxuqo5h	1	checkbox	...	{"value":false}	1679987089073	1679987089073	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
a7qxjz8y5ofbnxcebkze94piwgr	2023-03-28 07:04:49.083734+00	cxefo1ynaufbcdg58xj8yxuqo5h	1	text	## Checklist	{}	1679987089085	1679987089085	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
7xz41ryoukfru9p8j6aa187wbdo	2023-03-28 07:04:49.096924+00	cg3yoxg6e57gezydi4ekjneqear	1	checkbox	[Subtask 2]	{"value":false}	1679987089099	1679987089099	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
7qo79dfad8fdsim1n547841w9na	2023-03-28 07:04:49.109138+00	cg3yoxg6e57gezydi4ekjneqear	1	checkbox	[Subtask 1]	{"value":false}	1679987089111	1679987089111	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
71b5y8bjaztbrue6uabw5fuud9r	2023-03-28 07:04:49.121116+00	cg3yoxg6e57gezydi4ekjneqear	1	divider		{}	1679987089123	1679987089123	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
adk1hkaoguprfmfdgumdy795n6o	2023-03-28 07:04:49.133758+00	cg3yoxg6e57gezydi4ekjneqear	1	text	## Description\n*[Brief description of this task]*	{}	1679987089135	1679987089135	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
7667eaai5x3r9pqk8xiq5js567w	2023-03-28 07:04:49.147335+00	cgk4i5eftp3bobcrykxmkhmhghe	1	checkbox	[Subtask 2]	{"value":false}	1679987089149	1679987089149	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
7fcsi7gk71bywxkj89mgbok71gh	2023-03-28 07:04:49.160513+00	cgk4i5eftp3bobcrykxmkhmhghe	1	checkbox	[Subtask 3]	{"value":false}	1679987089162	1679987089162	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
a6ob8dqnmxf8ziddrrtaig4d8xa	2023-03-28 07:04:49.173952+00	cgk4i5eftp3bobcrykxmkhmhghe	1	text	## Description\n*[Brief description of this task]*	{}	1679987089176	1679987089176	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
7t1rrscn8qbd3ddjk6k8mbwyreo	2023-03-28 07:04:49.186591+00	cn1xgzc5nzbgk5b7fmj1wkuw5zo	1	divider		{}	1679987089188	1679987089188	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
745qbcks3ubnrmdfi5n55afegka	2023-03-28 07:04:49.199999+00	cn1xgzc5nzbgk5b7fmj1wkuw5zo	1	checkbox	[Subtask 3]	{"value":false}	1679987089202	1679987089202	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
7a3ukge8xxiddt8s9xh9ujizyzh	2023-03-28 07:04:49.21221+00	cn1xgzc5nzbgk5b7fmj1wkuw5zo	1	checkbox	[Subtask 2]	{"value":false}	1679987089214	1679987089214	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
a9n14dsjw7pd9df9gnoxunsow9o	2023-03-28 07:04:49.225434+00	cn1xgzc5nzbgk5b7fmj1wkuw5zo	1	text	## Description\n*[Brief description of this task]*	{}	1679987089227	1679987089227	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
7ywg3epcrcfrhtmgftuwae9pntr	2023-03-28 07:04:49.237531+00	cig74rakze7nrtqdjif583pk16e	1	checkbox	[Subtask 3]	{"value":false}	1679987089239	1679987089239	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
7a3daxfsy8irw9pfjgpqyij6cwh	2023-03-28 07:04:49.250378+00	cig74rakze7nrtqdjif583pk16e	1	checkbox	[Subtask 2]	{"value":false}	1679987089252	1679987089252	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
aurx9e7r5atyt9kasnq9jtsbjfo	2023-03-28 07:04:49.26268+00	cig74rakze7nrtqdjif583pk16e	1	text	## Description\n*[Brief description of this task]*	{}	1679987089264	1679987089264	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
7zs3kronwitfxmfjjrozfwmy36o	2023-03-28 07:04:49.275272+00	czw9es1e89fdpjr7cqptr1xq7qh	1	checkbox	[Subtask 3]	{"value":false}	1679987089277	1679987089277	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
7duygxtiiqin8fnyi193bxnrswr	2023-03-28 07:04:49.287764+00	czw9es1e89fdpjr7cqptr1xq7qh	1	divider		{}	1679987089289	1679987089289	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
7maymix349t8fdmy1cwqcqgp5oe	2023-03-28 07:04:49.300524+00	czw9es1e89fdpjr7cqptr1xq7qh	1	checkbox	...	{"value":false}	1679987089302	1679987089302	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
ayxkdoyjy6bby7ynpqzp5rjjidc	2023-03-28 07:04:49.31337+00	czw9es1e89fdpjr7cqptr1xq7qh	1	text	## Checklist	{}	1679987089315	1679987089315	0	bg5bjah1fmbbs3eedts6kfdaneo	system	0	system
cj6md4iqef3nwbkcg81ujy4zsxr	2023-03-28 07:04:49.327204+00	be9zqbr58efnozm9tiriq1gfyww	1	card	Start a daily journal	{"contentOrder":[],"icon":"✍️","isTemplate":false,"properties":{"af6fcbb8-ca56-4b73-83eb-37437b9a667d":"bf52bfe6-ac4c-4948-821f-83eaa1c7b04a","d6b1249b-bc18-45fc-889e-bec48fce80ef":"0a82977f-52bf-457b-841b-e2b7f76fb525","d9725d14-d5a8-48e5-8de1-6f8c004a9680":"3245a32d-f688-463b-87f4-8e7142c1b397"}}	1679987089329	1679987089329	0	be9zqbr58efnozm9tiriq1gfyww	system	0	system
c6datwj5oejrhxntkeszg35gkxw	2023-03-28 07:04:49.340014+00	be9zqbr58efnozm9tiriq1gfyww	1	card	Learn to paint	{"contentOrder":[],"icon":"🎨","isTemplate":false,"properties":{"af6fcbb8-ca56-4b73-83eb-37437b9a667d":"77c539af-309c-4db1-8329-d20ef7e9eacd","d6b1249b-bc18-45fc-889e-bec48fce80ef":"9a090e33-b110-4268-8909-132c5002c90e","d9725d14-d5a8-48e5-8de1-6f8c004a9680":"3245a32d-f688-463b-87f4-8e7142c1b397"}}	1679987089342	1679987089342	0	be9zqbr58efnozm9tiriq1gfyww	system	0	system
7io4zth6i7bnmuedkzzj1esnccr	2023-03-28 07:04:49.870273+00	cxxmymfyz8jy5zjh7ztrrzwurrw	1	checkbox	Set priorities and update statuses	{"value":false}	1679987089872	1679987089872	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
be9zqbr58efnozm9tiriq1gfyww	2023-03-28 07:04:49.320399+00		1	board	Personal Goals 	{"cardProperties":[{"id":"af6fcbb8-ca56-4b73-83eb-37437b9a667d","name":"Status","options":[{"color":"propColorRed","id":"bf52bfe6-ac4c-4948-821f-83eaa1c7b04a","value":"To Do"},{"color":"propColorYellow","id":"77c539af-309c-4db1-8329-d20ef7e9eacd","value":"Doing"},{"color":"propColorGreen","id":"98bdea27-0cce-4cde-8dc6-212add36e63a","value":"Done 🙌"}],"type":"select"},{"id":"d9725d14-d5a8-48e5-8de1-6f8c004a9680","name":"Category","options":[{"color":"propColorPurple","id":"3245a32d-f688-463b-87f4-8e7142c1b397","value":"Life Skills"},{"color":"propColorGreen","id":"80be816c-fc7a-4928-8489-8b02180f4954","value":"Finance"},{"color":"propColorOrange","id":"ffb3f951-b47f-413b-8f1d-238666728008","value":"Health"}],"type":"select"},{"id":"d6b1249b-bc18-45fc-889e-bec48fce80ef","name":"Target","options":[{"color":"propColorBlue","id":"9a090e33-b110-4268-8909-132c5002c90e","value":"Q1"},{"color":"propColorBrown","id":"0a82977f-52bf-457b-841b-e2b7f76fb525","value":"Q2"},{"color":"propColorGreen","id":"6e7139e4-5358-46bb-8c01-7b029a57b80a","value":"Q3"},{"color":"propColorPurple","id":"d5371c63-66bf-4468-8738-c4dc4bea4843","value":"Q4"}],"type":"select"},{"id":"ajy6xbebzopojaenbnmfpgtdwso","name":"Due Date","options":[],"type":"date"}],"description":"Use this template to set and accomplish new personal goals.","icon":"⛰️","isTemplate":true,"showDescription":true,"templateVer":4,"trackingTemplateId":"7f32dc8d2ae008cfe56554e9363505cc"}	1679987089322	1679987089322	0	be9zqbr58efnozm9tiriq1gfyww	system	0	system
cp31watzh13g39ykcngbyjdco4a	2023-03-28 07:04:49.333653+00	be9zqbr58efnozm9tiriq1gfyww	1	card	Run 3 times a week	{"contentOrder":[],"icon":"🏃","isTemplate":false,"properties":{"af6fcbb8-ca56-4b73-83eb-37437b9a667d":"bf52bfe6-ac4c-4948-821f-83eaa1c7b04a","d6b1249b-bc18-45fc-889e-bec48fce80ef":"6e7139e4-5358-46bb-8c01-7b029a57b80a","d9725d14-d5a8-48e5-8de1-6f8c004a9680":"ffb3f951-b47f-413b-8f1d-238666728008"}}	1679987089336	1679987089336	0	be9zqbr58efnozm9tiriq1gfyww	system	0	system
cnnmjrea1utftxmasdwpxfitaey	2023-03-28 07:04:49.346747+00	be9zqbr58efnozm9tiriq1gfyww	1	card	Open retirement account	{"contentOrder":[],"icon":"🏦","isTemplate":false,"properties":{"af6fcbb8-ca56-4b73-83eb-37437b9a667d":"bf52bfe6-ac4c-4948-821f-83eaa1c7b04a","d6b1249b-bc18-45fc-889e-bec48fce80ef":"0a82977f-52bf-457b-841b-e2b7f76fb525","d9725d14-d5a8-48e5-8de1-6f8c004a9680":"80be816c-fc7a-4928-8489-8b02180f4954"}}	1679987089349	1679987089349	0	be9zqbr58efnozm9tiriq1gfyww	system	0	system
vgietbc8izbbojjbuw3hc61n7uo	2023-03-28 07:04:49.359151+00	be9zqbr58efnozm9tiriq1gfyww	1	view	Calendar View	{"cardOrder":[],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{},"dateDisplayPropertyId":"ajy6xbebzopojaenbnmfpgtdwso","defaultTemplateId":"","filter":{"filters":[],"operation":"and"},"hiddenOptionIds":[],"kanbanCalculations":{},"sortOptions":[],"viewType":"calendar","visibleOptionIds":[],"visiblePropertyIds":["__title"]}	1679987089361	1679987089361	0	be9zqbr58efnozm9tiriq1gfyww	system	0	system
bgg9adjeykfdu9n5jrsja9ci73w	2023-03-28 07:04:49.37589+00		1	board	Content Calendar 	{"cardProperties":[{"id":"ae9ar615xoknd8hw8py7mbyr7zo","name":"Status","options":[{"color":"propColorGray","id":"awna1nuarjca99m9s4uiy9kwj5h","value":"Idea 💡"},{"color":"propColorOrange","id":"a9ana1e9w673o5cp8md4xjjwfto","value":"Draft"},{"color":"propColorPurple","id":"apy9dcd7zmand615p3h53zjqxjh","value":"In Review"},{"color":"propColorBlue","id":"acri4cm3bmay55f7ksztphmtnga","value":"Ready to Publish"},{"color":"propColorGreen","id":"amsowcd9a8e1kid317r7ttw6uzh","value":"Published 🎉"}],"type":"select"},{"id":"aysx3atqexotgwp5kx6h5i5ancw","name":"Type","options":[{"color":"propColorOrange","id":"aywiofmmtd3ofgzj95ysky4pjga","value":"Press Release"},{"color":"propColorGreen","id":"apqdgjrmsmx8ngmp7zst51647de","value":"Sponsored Post"},{"color":"propColorPurple","id":"a3woynbjnb7j16e74uw3pubrytw","value":"Customer Story"},{"color":"propColorRed","id":"aq36k5pkpfcypqb3idw36xdi1fh","value":"Product Release"},{"color":"propColorGray","id":"azn66pmk34adygnizjqhgiac4ia","value":"Partnership"},{"color":"propColorBlue","id":"aj8y675weso8kpb6eceqbpj4ruw","value":"Feature Announcement"},{"color":"propColorYellow","id":"a3xky7ygn14osr1mokerbfah5cy","value":"Article"}],"type":"select"},{"id":"ab6mbock6styfe6htf815ph1mhw","name":"Channel","options":[{"color":"propColorBrown","id":"a8xceonxiu4n3c43szhskqizicr","value":"Website"},{"color":"propColorGreen","id":"a3pdzi53kpbd4okzdkz6khi87zo","value":"Blog"},{"color":"propColorOrange","id":"a3d9ux4fmi3anyd11kyipfbhwde","value":"Email"},{"color":"propColorRed","id":"a8cbbfdwocx73zn3787cx6gacsh","value":"Podcast"},{"color":"propColorPink","id":"aigjtpcaxdp7d6kmctrwo1ztaia","value":"Print"},{"color":"propColorBlue","id":"af1wsn13muho59e7ghwaogxy5ey","value":"Facebook"},{"color":"propColorGray","id":"a47zajfxwhsg6q8m7ppbiqs7jge","value":"LinkedIn"},{"color":"propColorYellow","id":"az8o8pfe9hq6s7xaehoqyc3wpyc","value":"Twitter"}],"type":"multiSelect"},{"id":"ao44fz8nf6z6tuj1x31t9yyehcc","name":"Assignee","options":[],"type":"person"},{"id":"a39x5cybshwrbjpc3juaakcyj6e","name":"Due Date","options":[],"type":"date"},{"id":"agqsoiipowmnu9rdwxm57zrehtr","name":"Publication Date","options":[],"type":"date"},{"id":"ap4e7kdg7eip7j3c3oyiz39eaoc","name":"Link","options":[],"type":"url"}],"description":"Use this template to plan and organize your editorial content.","icon":"📅","isTemplate":true,"showDescription":true,"templateVer":4,"trackingTemplateId":"c75fbd659d2258b5183af2236d176ab4"}	1679987089379	1679987089379	0	bgg9adjeykfdu9n5jrsja9ci73w	system	0	system
cdcgxou56i3yybr5tcndnj8ufba	2023-03-28 07:04:49.39089+00	bgg9adjeykfdu9n5jrsja9ci73w	1	card	[Tweet] Mattermost v6.1 includes card @-mention notifications in Boards	{"contentOrder":["7i96m7nbsdsex8n6hzuzrmdfjuy","7ed5bwp3gr8yax3mhtuwiaa9gjy","a6k49iuhpabd7xp19hisoxrpmaw","aipt73yisntrszg4mojgtbo6gar","abdasiyq4k7ndtfrdadrias8sjy","7ms5wci8spjrdjp3qq6ns1kc5tr"],"icon":"🐤","isTemplate":false,"properties":{"a39x5cybshwrbjpc3juaakcyj6e":"{\\"from\\":1639051200000}","ab6mbock6styfe6htf815ph1mhw":["az8o8pfe9hq6s7xaehoqyc3wpyc"],"ae9ar615xoknd8hw8py7mbyr7zo":"a9ana1e9w673o5cp8md4xjjwfto","agqsoiipowmnu9rdwxm57zrehtr":"{\\"from\\":1637668800000}","ap4e7kdg7eip7j3c3oyiz39eaoc":"https://twitter.com/Mattermost/status/1463145633162969097?s=20","aysx3atqexotgwp5kx6h5i5ancw":"aj8y675weso8kpb6eceqbpj4ruw"}}	1679987089393	1679987089393	0	bgg9adjeykfdu9n5jrsja9ci73w	system	0	system
cq3oek9htutb9fpr43u8fk49u7e	2023-03-28 07:04:49.40341+00	bgg9adjeykfdu9n5jrsja9ci73w	1	card	Unblocking Workflows: The Guide to Developer Productivity	{"contentOrder":["77tz16jtz5x73ncs3dxc3fp1d7h","aghhgqaieubyo3nnroieme8f19w"],"icon":"💻","isTemplate":false,"properties":{"a39x5cybshwrbjpc3juaakcyj6e":"{\\"from\\":1638532800000}","ab6mbock6styfe6htf815ph1mhw":["a3pdzi53kpbd4okzdkz6khi87zo"],"ae9ar615xoknd8hw8py7mbyr7zo":"apy9dcd7zmand615p3h53zjqxjh","agqsoiipowmnu9rdwxm57zrehtr":"{\\"from\\":1639483200000}","ap4e7kdg7eip7j3c3oyiz39eaoc":"https://mattermost.com/newsroom/press-releases/mattermost-unveils-definitive-report-on-the-state-of-developer-productivity-unblocking-workflows-the-guide-to-developer-productivity-2022-edition/","aysx3atqexotgwp5kx6h5i5ancw":"a3xky7ygn14osr1mokerbfah5cy"}}	1679987089405	1679987089405	0	bgg9adjeykfdu9n5jrsja9ci73w	system	0	system
vnxs8cwanctb7ubjn18mq9shg9a	2023-03-28 07:04:49.41655+00	bgg9adjeykfdu9n5jrsja9ci73w	1	view	Due Date Calendar	{"cardOrder":[],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{},"dateDisplayPropertyId":"a39x5cybshwrbjpc3juaakcyj6e","defaultTemplateId":"cff1jmrxfrirgbeebhr9qd7nida","filter":{"filters":[],"operation":"and"},"hiddenOptionIds":[],"kanbanCalculations":{},"sortOptions":[],"viewType":"calendar","visibleOptionIds":[],"visiblePropertyIds":["__title"]}	1679987089418	1679987089418	0	bgg9adjeykfdu9n5jrsja9ci73w	system	0	system
aej55m9ebipb1ugp8netwkdkdic	2023-03-28 07:04:49.639883+00	cfefgwjke6bbxpjpig618g9bpte	1	text	## Steps to reproduce the behavior\n\n1. Go to ...\n2. Select  ...\n3. Scroll down to ...\n4. See error\n\n## Expected behavior\n\n*[A clear and concise description of what you expected to happen.]*\n\n## Screenshots\n\n*[If applicable, add screenshots to elaborate on the problem.]*\n\n## Edition and Platform\n\n - Edition: *[e.g. Personal Desktop / Personal Server / Mattermost plugin]*\n - Version: *[e.g. v0.9.0]*\n - Browser and OS: *[e.g. Chrome 91 on macOS, Edge 93 on Windows]*\n\n## Additional context\n\n*[Add any other context about the problem here.]*	{}	1679987089642	1679987089642	0	b78h88gsstbnfjk1tujcf6fx4ww	system	0	system
v1uk5t65omfb88mtgsdt6p8gjpo	2023-03-28 07:04:49.365638+00	be9zqbr58efnozm9tiriq1gfyww	1	view	By Date	{"cardOrder":[],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{},"defaultTemplateId":"","filter":{"filters":[],"operation":"and"},"groupById":"d6b1249b-bc18-45fc-889e-bec48fce80ef","hiddenOptionIds":[],"kanbanCalculations":{},"sortOptions":[],"viewType":"board","visibleOptionIds":["9a090e33-b110-4268-8909-132c5002c90e","0a82977f-52bf-457b-841b-e2b7f76fb525","6e7139e4-5358-46bb-8c01-7b029a57b80a","d5371c63-66bf-4468-8738-c4dc4bea4843",""],"visiblePropertyIds":["d9725d14-d5a8-48e5-8de1-6f8c004a9680"]}	1679987089368	1679987089367	0	be9zqbr58efnozm9tiriq1gfyww	system	0	system
cqecoatk3kb8gbf34q8y8dxw1hc	2023-03-28 07:04:49.384407+00	bgg9adjeykfdu9n5jrsja9ci73w	1	card	New Project and Workflow Management Solutions for Developers	{"contentOrder":["71qhnzuec6esdi6fnynwpze4xya","anm485iek57f5mjmt6snb87e19w"],"icon":"🎯","isTemplate":false,"properties":{"a39x5cybshwrbjpc3juaakcyj6e":"{\\"from\\":1645790400000}","ab6mbock6styfe6htf815ph1mhw":["a8xceonxiu4n3c43szhskqizicr","a3pdzi53kpbd4okzdkz6khi87zo","a3d9ux4fmi3anyd11kyipfbhwde"],"ae9ar615xoknd8hw8py7mbyr7zo":"awna1nuarjca99m9s4uiy9kwj5h","ap4e7kdg7eip7j3c3oyiz39eaoc":"https://mattermost.com/newsroom/press-releases/mattermost-launches-new-project-and-workflow-management-solutions-for-developers/","aysx3atqexotgwp5kx6h5i5ancw":"aywiofmmtd3ofgzj95ysky4pjga"}}	1679987089386	1679987089386	0	bgg9adjeykfdu9n5jrsja9ci73w	system	0	system
chee7jnbukbrm8n4a6983nox7za	2023-03-28 07:04:49.396985+00	bgg9adjeykfdu9n5jrsja9ci73w	1	card	Top 10 Must-Have DevOps Tools in 2021	{"contentOrder":["7fo1utqc8x1z1z6hzg33hes1ktc","abz8sfh7z13y6ipfxrk9d4nasoa"],"icon":"🛠️","isTemplate":false,"properties":{"a39x5cybshwrbjpc3juaakcyj6e":"{\\"from\\":1636113600000}","ab6mbock6styfe6htf815ph1mhw":["a8xceonxiu4n3c43szhskqizicr"],"ae9ar615xoknd8hw8py7mbyr7zo":"a9ana1e9w673o5cp8md4xjjwfto","agqsoiipowmnu9rdwxm57zrehtr":"{\\"from\\":1637323200000}","ap4e7kdg7eip7j3c3oyiz39eaoc":"https://www.toolbox.com/tech/devops/articles/best-devops-tools/","aysx3atqexotgwp5kx6h5i5ancw":"a3xky7ygn14osr1mokerbfah5cy"}}	1679987089399	1679987089399	0	bgg9adjeykfdu9n5jrsja9ci73w	system	0	system
ve8ne6mezf3f9txryomanbtrfiy	2023-03-28 07:04:49.409913+00	bgg9adjeykfdu9n5jrsja9ci73w	1	view	By Status	{"cardOrder":[null,"cdbfkd15d6iy18rgx1tskmfsr6c","cn8yofg9rtkgmzgmb5xdi56p3ic","csgsnnywpuqzs5jgq87snk9x17e","cqwaytore5y487wdu8zffppqnea",null],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{},"defaultTemplateId":"cff1jmrxfrirgbeebhr9qd7nida","filter":{"filters":[],"operation":"and"},"hiddenOptionIds":[],"kanbanCalculations":{},"sortOptions":[],"viewType":"board","visibleOptionIds":["awna1nuarjca99m9s4uiy9kwj5h","a9ana1e9w673o5cp8md4xjjwfto","apy9dcd7zmand615p3h53zjqxjh","acri4cm3bmay55f7ksztphmtnga","amsowcd9a8e1kid317r7ttw6uzh",""],"visiblePropertyIds":["ab6mbock6styfe6htf815ph1mhw"]}	1679987089412	1679987089412	0	bgg9adjeykfdu9n5jrsja9ci73w	system	0	system
vt4jd6k5d7jrn5r6hr4jnhxu81e	2023-03-28 07:04:49.423081+00	bgg9adjeykfdu9n5jrsja9ci73w	1	view	Publication Calendar	{"cardOrder":[],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{},"dateDisplayPropertyId":"agqsoiipowmnu9rdwxm57zrehtr","defaultTemplateId":"cff1jmrxfrirgbeebhr9qd7nida","filter":{"filters":[],"operation":"and"},"hiddenOptionIds":[],"kanbanCalculations":{},"sortOptions":[],"viewType":"calendar","visibleOptionIds":[],"visiblePropertyIds":["__title"]}	1679987089425	1679987089425	0	bgg9adjeykfdu9n5jrsja9ci73w	system	0	system
anm485iek57f5mjmt6snb87e19w	2023-03-28 07:04:49.436508+00	cqecoatk3kb8gbf34q8y8dxw1hc	1	text	## Research\n- ...\n- ...\n\n## Plan\n- ...\n- ...\n\n## Notes\n- ...\n- ...	{}	1679987089438	1679987089438	0	bgg9adjeykfdu9n5jrsja9ci73w	system	0	system
a6k49iuhpabd7xp19hisoxrpmaw	2023-03-28 07:04:49.449515+00	cdcgxou56i3yybr5tcndnj8ufba	1	text	## Research\n- ...\n- ...\n\n## Plan\n- ...\n- ...\n\n## Notes\n- ...\n- ...	{}	1679987089451	1679987089451	0	bgg9adjeykfdu9n5jrsja9ci73w	system	0	system
au337851hkfnepxdb9udy8knthy	2023-03-28 07:04:49.462935+00	cff1jmrxfrirgbeebhr9qd7nida	1	text	## Research\n- ...\n- ...\n\n## Plan\n- ...\n- ...\n\n## Notes\n- ...\n- ...	{}	1679987089465	1679987089465	0	bgg9adjeykfdu9n5jrsja9ci73w	system	0	system
ajkuf1rku83yiu83zksgqmqux4w	2023-03-28 07:04:49.475709+00	cff1jmrxfrirgbeebhr9qd7nida	1	text	## Research\n- ...\n- ...\n\n## Plan\n- ...\n- ...\n\n## Notes\n- ...\n- ...	{}	1679987089477	1679987089477	0	bgg9adjeykfdu9n5jrsja9ci73w	system	0	system
aghhgqaieubyo3nnroieme8f19w	2023-03-28 07:04:49.488265+00	cq3oek9htutb9fpr43u8fk49u7e	1	text	## Research\n- ...\n- ...\n\n## Plan\n- ...\n- ...\n\n## Notes\n- ...\n- ...	{}	1679987089490	1679987089490	0	bgg9adjeykfdu9n5jrsja9ci73w	system	0	system
cmmetesf4wfrizxrmfk1xc66fcw	2023-03-28 07:04:49.515581+00	b78h88gsstbnfjk1tujcf6fx4ww	1	card	App crashing	{"contentOrder":["79t7rkiuspeneqi9xurou9tqzwh","aozms76o85prndfqtigkqixqame","a3stx3gaxnp8f7y4p5fjypcnj3y","73egy4qcmc78hzfacr83dqbh1uh"],"icon":"📉","isTemplate":false,"properties":{"20717ad3-5741-4416-83f1-6f133fff3d11":"1fdbb515-edd2-4af5-80fc-437ed2211a49","50117d52-bcc7-4750-82aa-831a351c44a0":"ec6d2bc5-df2b-4f77-8479-e59ceb039946","60985f46-3e41-486e-8213-2b987440ea1c":"c01676ca-babf-4534-8be5-cce2287daa6c","f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e":"cb8ecdac-38be-4d36-8712-c4d58cc8a8e9"}}	1679987089517	1679987089517	0	b78h88gsstbnfjk1tujcf6fx4ww	system	0	system
cr4jdkhckxfyzd8p9rurgy7y6yw	2023-03-28 07:04:49.528542+00	b78h88gsstbnfjk1tujcf6fx4ww	1	card	Standard templates	{"contentOrder":["7uonmjk41nipnrsi6tz8wau5ssh","axwwxncix8fd5dpp1c3chkdogsa"],"icon":"🗺️","isTemplate":false,"properties":{"20717ad3-5741-4416-83f1-6f133fff3d11":"6eea96c9-4c61-4968-8554-4b7537e8f748","50117d52-bcc7-4750-82aa-831a351c44a0":"ec6d2bc5-df2b-4f77-8479-e59ceb039946","60985f46-3e41-486e-8213-2b987440ea1c":"ed4a5340-460d-461b-8838-2c56e8ee59fe","ai7ajsdk14w7x5s8up3dwir77te":"https://mattermost.com/boards/","f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e":"e6a7f297-4440-4783-8ab3-3af5ba62ca11"}}	1679987089531	1679987089531	0	b78h88gsstbnfjk1tujcf6fx4ww	system	0	system
c4ion7h4ir3bdunms81f7cuphjc	2023-03-28 07:04:49.54201+00	b78h88gsstbnfjk1tujcf6fx4ww	1	card	Review API design	{"contentOrder":["ahdsmycz5c3nbz8pcrux1ctiw4y"],"icon":"🛣️","isTemplate":false,"properties":{"20717ad3-5741-4416-83f1-6f133fff3d11":"424ea5e3-9aa1-4075-8c5c-01b44b66e634","50117d52-bcc7-4750-82aa-831a351c44a0":"8c557f69-b0ed-46ec-83a3-8efab9d47ef5","60985f46-3e41-486e-8213-2b987440ea1c":"14892380-1a32-42dd-8034-a0cea32bc7e6","ai7ajsdk14w7x5s8up3dwir77te":"https://mattermost.com/boards/","f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e":"c62172ea-5da7-4dec-8186-37267d8ee9a7"}}	1679987089544	1679987089544	0	b78h88gsstbnfjk1tujcf6fx4ww	system	0	system
vpnnrtoqkyfgf5qy3t79b41nddy	2023-03-28 07:04:49.555012+00	b78h88gsstbnfjk1tujcf6fx4ww	1	view	Calendar View	{"cardOrder":[],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{},"dateDisplayPropertyId":"a4378omyhmgj3bex13sj4wbpfiy","defaultTemplateId":"","filter":{"filters":[],"operation":"and"},"hiddenOptionIds":[],"kanbanCalculations":{},"sortOptions":[],"viewType":"calendar","visibleOptionIds":[],"visiblePropertyIds":["__title"]}	1679987089557	1679987089557	0	b78h88gsstbnfjk1tujcf6fx4ww	system	0	system
a9x8t54yhppf4imxp11e5y3bjwc	2023-03-28 07:04:49.653756+00	cidz4imnqhir48brz6e8hxhfrhy	1	text	## Description\n*[Brief description of this task]*\n\n## Requirements\n- *[Requirement 1]*\n- *[Requirement 2]*\n- ...	{}	1679987089656	1679987089656	0	b78h88gsstbnfjk1tujcf6fx4ww	system	0	system
vc66mno9g3fr9jc8ioaiekeyo6w	2023-03-28 07:04:49.429531+00	bgg9adjeykfdu9n5jrsja9ci73w	1	view	Content List	{"cardOrder":[],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{"__title":322,"ab6mbock6styfe6htf815ph1mhw":229,"aysx3atqexotgwp5kx6h5i5ancw":208},"defaultTemplateId":"cff1jmrxfrirgbeebhr9qd7nida","filter":{"filters":[],"operation":"and"},"hiddenOptionIds":[],"kanbanCalculations":{},"sortOptions":[{"propertyId":"a39x5cybshwrbjpc3juaakcyj6e","reversed":false}],"viewType":"table","visibleOptionIds":[],"visiblePropertyIds":["ae9ar615xoknd8hw8py7mbyr7zo","aysx3atqexotgwp5kx6h5i5ancw","ab6mbock6styfe6htf815ph1mhw","ao44fz8nf6z6tuj1x31t9yyehcc","a39x5cybshwrbjpc3juaakcyj6e","agqsoiipowmnu9rdwxm57zrehtr","ap4e7kdg7eip7j3c3oyiz39eaoc"]}	1679987089432	1679987089432	0	bgg9adjeykfdu9n5jrsja9ci73w	system	0	system
7ms5wci8spjrdjp3qq6ns1kc5tr	2023-03-28 07:04:49.44314+00	cdcgxou56i3yybr5tcndnj8ufba	1	image		{"fileId":"7y5kr8x8ybpnwdykjfuz57rggrh.png"}	1679987089445	1679987089445	0	bgg9adjeykfdu9n5jrsja9ci73w	system	0	system
aipt73yisntrszg4mojgtbo6gar	2023-03-28 07:04:49.456+00	cdcgxou56i3yybr5tcndnj8ufba	1	text	## Media	{}	1679987089458	1679987089458	0	bgg9adjeykfdu9n5jrsja9ci73w	system	0	system
au6egixtxrtr7fe9d4p4xphqzho	2023-03-28 07:04:49.469554+00	cff1jmrxfrirgbeebhr9qd7nida	1	text	## Research\n- ...\n- ...\n- ...\n\n## Plan\n- ...\n- ...\n- ...\n\n## Notes\n- ...\n- ...\n- ...	{}	1679987089471	1679987089471	0	bgg9adjeykfdu9n5jrsja9ci73w	system	0	system
abz8sfh7z13y6ipfxrk9d4nasoa	2023-03-28 07:04:49.481518+00	chee7jnbukbrm8n4a6983nox7za	1	text	## Research\n- ...\n- ...\n\n## Plan\n- ...\n- ...\n\n## Notes\n- ...\n- ...	{}	1679987089483	1679987089483	0	bgg9adjeykfdu9n5jrsja9ci73w	system	0	system
b78h88gsstbnfjk1tujcf6fx4ww	2023-03-28 07:04:49.508487+00		1	board	Roadmap 	{"cardProperties":[{"id":"50117d52-bcc7-4750-82aa-831a351c44a0","name":"Status","options":[{"color":"propColorGray","id":"8c557f69-b0ed-46ec-83a3-8efab9d47ef5","value":"Not Started"},{"color":"propColorYellow","id":"ec6d2bc5-df2b-4f77-8479-e59ceb039946","value":"In Progress"},{"color":"propColorGreen","id":"849766ba-56a5-48d1-886f-21672f415395","value":"Complete 🙌"}],"type":"select"},{"id":"20717ad3-5741-4416-83f1-6f133fff3d11","name":"Type","options":[{"color":"propColorYellow","id":"424ea5e3-9aa1-4075-8c5c-01b44b66e634","value":"Epic ⛰"},{"color":"propColorGreen","id":"6eea96c9-4c61-4968-8554-4b7537e8f748","value":"Task 🔨"},{"color":"propColorRed","id":"1fdbb515-edd2-4af5-80fc-437ed2211a49","value":"Bug 🐞"}],"type":"select"},{"id":"60985f46-3e41-486e-8213-2b987440ea1c","name":"Sprint","options":[{"color":"propColorBrown","id":"c01676ca-babf-4534-8be5-cce2287daa6c","value":"Sprint 1"},{"color":"propColorPurple","id":"ed4a5340-460d-461b-8838-2c56e8ee59fe","value":"Sprint 2"},{"color":"propColorBlue","id":"14892380-1a32-42dd-8034-a0cea32bc7e6","value":"Sprint 3"}],"type":"select"},{"id":"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e","name":"Priority","options":[{"color":"propColorRed","id":"cb8ecdac-38be-4d36-8712-c4d58cc8a8e9","value":"P1 🔥"},{"color":"propColorYellow","id":"e6a7f297-4440-4783-8ab3-3af5ba62ca11","value":"P2"},{"color":"propColorGray","id":"c62172ea-5da7-4dec-8186-37267d8ee9a7","value":"P3"}],"type":"select"},{"id":"aphg37f7zbpuc3bhwhp19s1ribh","name":"Assignee","options":[],"type":"person"},{"id":"a4378omyhmgj3bex13sj4wbpfiy","name":"Due Date","options":[],"type":"date"},{"id":"a36o9q1yik6nmar6ri4q4uca7ey","name":"Created Date","options":[],"type":"createdTime"},{"id":"ai7ajsdk14w7x5s8up3dwir77te","name":"Design Link","options":[],"type":"url"}],"description":"Use this template to plan your roadmap and manage your releases more efficiently.","icon":"🗺️","isTemplate":true,"showDescription":true,"templateVer":4,"trackingTemplateId":"b728c6ca730e2cfc229741c5a4712b65"}	1679987089511	1679987089511	0	b78h88gsstbnfjk1tujcf6fx4ww	system	0	system
cs6kzm7ejcfrk5coxkgj8kmez7y	2023-03-28 07:04:49.521847+00	b78h88gsstbnfjk1tujcf6fx4ww	1	card	Calendar view	{"contentOrder":["7df11783ny67mdnognqae31ax6y","af5c4op43obb7tqxudrsj3ymcxr"],"icon":"📆","isTemplate":false,"properties":{"20717ad3-5741-4416-83f1-6f133fff3d11":"6eea96c9-4c61-4968-8554-4b7537e8f748","50117d52-bcc7-4750-82aa-831a351c44a0":"849766ba-56a5-48d1-886f-21672f415395","60985f46-3e41-486e-8213-2b987440ea1c":"c01676ca-babf-4534-8be5-cce2287daa6c","ai7ajsdk14w7x5s8up3dwir77te":"https://mattermost.com/boards/","f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e":"e6a7f297-4440-4783-8ab3-3af5ba62ca11"}}	1679987089524	1679987089524	0	b78h88gsstbnfjk1tujcf6fx4ww	system	0	system
cy3nctg5wpibmzmor5poce41zey	2023-03-28 07:04:49.535416+00	b78h88gsstbnfjk1tujcf6fx4ww	1	card	Import / Export	{"contentOrder":["ac8taob8yatyminhosfzxrdigcr"],"icon":"🚢","isTemplate":false,"properties":{"20717ad3-5741-4416-83f1-6f133fff3d11":"6eea96c9-4c61-4968-8554-4b7537e8f748","50117d52-bcc7-4750-82aa-831a351c44a0":"ec6d2bc5-df2b-4f77-8479-e59ceb039946","60985f46-3e41-486e-8213-2b987440ea1c":"c01676ca-babf-4534-8be5-cce2287daa6c","ai7ajsdk14w7x5s8up3dwir77te":"https://mattermost.com/boards/","f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e":"e6a7f297-4440-4783-8ab3-3af5ba62ca11"}}	1679987089537	1679987089537	0	b78h88gsstbnfjk1tujcf6fx4ww	system	0	system
co14yqycektdm5fofehfhmcidio	2023-03-28 07:04:49.548527+00	b78h88gsstbnfjk1tujcf6fx4ww	1	card	Icons don't display	{"contentOrder":["a5qexpks9ppb1z8fosmhaai4nmw","aouab4whjb7ruxb1eo1hbe6mwba","788eckchipbb4brzk6nanuy8khh"],"icon":"💻","isTemplate":false,"properties":{"20717ad3-5741-4416-83f1-6f133fff3d11":"1fdbb515-edd2-4af5-80fc-437ed2211a49","50117d52-bcc7-4750-82aa-831a351c44a0":"8c557f69-b0ed-46ec-83a3-8efab9d47ef5","60985f46-3e41-486e-8213-2b987440ea1c":"ed4a5340-460d-461b-8838-2c56e8ee59fe","ai7ajsdk14w7x5s8up3dwir77te":"https://mattermost.com/boards/","f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e":"e6a7f297-4440-4783-8ab3-3af5ba62ca11"}}	1679987089550	1679987089550	0	b78h88gsstbnfjk1tujcf6fx4ww	system	0	system
v71ty7wtzujn39cbahqpk5po9tw	2023-03-28 07:04:49.561384+00	b78h88gsstbnfjk1tujcf6fx4ww	1	view	Board: Sprints	{"cardOrder":["cmmetesf4wfrizxrmfk1xc66fcw","cs6kzm7ejcfrk5coxkgj8kmez7y","cr4jdkhckxfyzd8p9rurgy7y6yw","co14yqycektdm5fofehfhmcidio","cy3nctg5wpibmzmor5poce41zey","c4ion7h4ir3bdunms81f7cuphjc"],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{},"defaultTemplateId":"cidz4imnqhir48brz6e8hxhfrhy","filter":{"filters":[],"operation":"and"},"groupById":"60985f46-3e41-486e-8213-2b987440ea1c","hiddenOptionIds":[],"kanbanCalculations":{},"sortOptions":[{"propertyId":"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e","reversed":false}],"viewType":"board","visibleOptionIds":["c01676ca-babf-4534-8be5-cce2287daa6c","ed4a5340-460d-461b-8838-2c56e8ee59fe","14892380-1a32-42dd-8034-a0cea32bc7e6",""],"visiblePropertyIds":["20717ad3-5741-4416-83f1-6f133fff3d11","f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e"]}	1679987089563	1679987089563	0	b78h88gsstbnfjk1tujcf6fx4ww	system	0	system
vrwjscib4n7dkmc3dxeyuyftdba	2023-03-28 07:04:49.574253+00	b78h88gsstbnfjk1tujcf6fx4ww	1	view	Board: Status	{"cardOrder":["cmmetesf4wfrizxrmfk1xc66fcw","cm4w7cc3aac6s9jdcujbs4j8f4r","c6egh6cpnj137ixdoitsoxq17oo","cct9u78utsdyotmejbmwwg66ihr","cmft87it1q7yebbd51ij9k65xbw","c9fe77j9qcruxf4itzib7ag6f1c","coup7afjknqnzbdwghiwbsq541w","c5ex1hndz8qyc8gx6ofbfeksftc"],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{},"defaultTemplateId":"cidz4imnqhir48brz6e8hxhfrhy","filter":{"filters":[],"operation":"and"},"groupById":"50117d52-bcc7-4750-82aa-831a351c44a0","hiddenOptionIds":[],"kanbanCalculations":{},"sortOptions":[{"propertyId":"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e","reversed":false}],"viewType":"board","visibleOptionIds":["8c557f69-b0ed-46ec-83a3-8efab9d47ef5","ec6d2bc5-df2b-4f77-8479-e59ceb039946","849766ba-56a5-48d1-886f-21672f415395",""],"visiblePropertyIds":["20717ad3-5741-4416-83f1-6f133fff3d11","60985f46-3e41-486e-8213-2b987440ea1c","f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e"]}	1679987089576	1679987089576	0	b78h88gsstbnfjk1tujcf6fx4ww	system	0	system
73egy4qcmc78hzfacr83dqbh1uh	2023-03-28 07:04:49.587157+00	cmmetesf4wfrizxrmfk1xc66fcw	1	image		{"fileId":"77pe9r4ckbin438ph3f18bpatua.png"}	1679987089589	1679987089589	0	b78h88gsstbnfjk1tujcf6fx4ww	system	0	system
a3stx3gaxnp8f7y4p5fjypcnj3y	2023-03-28 07:04:49.599984+00	cmmetesf4wfrizxrmfk1xc66fcw	1	text	## Screenshots\n*[If applicable, add screenshots to elaborate on the problem.]*	{}	1679987089602	1679987089602	0	b78h88gsstbnfjk1tujcf6fx4ww	system	0	system
vdkhdpp6357gz8ftb9q7k8x6c4y	2023-03-28 07:04:49.56771+00	b78h88gsstbnfjk1tujcf6fx4ww	1	view	List: Tasks 🔨	{"cardOrder":[],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{"50117d52-bcc7-4750-82aa-831a351c44a0":139,"__title":280},"defaultTemplateId":"","filter":{"filters":[{"condition":"includes","propertyId":"20717ad3-5741-4416-83f1-6f133fff3d11","values":["6eea96c9-4c61-4968-8554-4b7537e8f748"]}],"operation":"and"},"hiddenOptionIds":[],"kanbanCalculations":{},"sortOptions":[{"propertyId":"50117d52-bcc7-4750-82aa-831a351c44a0","reversed":true}],"viewType":"table","visibleOptionIds":[],"visiblePropertyIds":["50117d52-bcc7-4750-82aa-831a351c44a0","20717ad3-5741-4416-83f1-6f133fff3d11","60985f46-3e41-486e-8213-2b987440ea1c","f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e"]}	1679987089569	1679987089569	0	b78h88gsstbnfjk1tujcf6fx4ww	system	0	system
v8qt64s7dnj8t7pocdqummznnqa	2023-03-28 07:04:49.580757+00	b78h88gsstbnfjk1tujcf6fx4ww	1	view	List: Bugs 🐞	{"cardOrder":[],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{"50117d52-bcc7-4750-82aa-831a351c44a0":145,"__title":280},"defaultTemplateId":"","filter":{"filters":[{"condition":"includes","propertyId":"20717ad3-5741-4416-83f1-6f133fff3d11","values":["1fdbb515-edd2-4af5-80fc-437ed2211a49"]}],"operation":"and"},"hiddenOptionIds":[],"kanbanCalculations":{},"sortOptions":[{"propertyId":"f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e","reversed":false}],"viewType":"table","visibleOptionIds":[],"visiblePropertyIds":["50117d52-bcc7-4750-82aa-831a351c44a0","20717ad3-5741-4416-83f1-6f133fff3d11","60985f46-3e41-486e-8213-2b987440ea1c","f7f3ad42-b31a-4ac2-81f0-28ea80c5b34e"]}	1679987089583	1679987089583	0	b78h88gsstbnfjk1tujcf6fx4ww	system	0	system
aozms76o85prndfqtigkqixqame	2023-03-28 07:04:49.59334+00	cmmetesf4wfrizxrmfk1xc66fcw	1	text	## Steps to reproduce the behavior\n1. Go to ...\n2. Select  ...\n3. Scroll down to ...\n4. See error\n\n## Expected behavior\n*[A clear and concise description of what you expected to happen.]*\n\n## Edition and Platform\n- Edition: *[e.g. Personal Desktop / Personal Server / Mattermost plugin]*\n- Version: *[e.g. v0.9.0]*\n- Browser and OS: *[e.g. Chrome 91 on macOS, Edge 93 on Windows]*\n\n## Additional context\n*[Add any other context about the problem here.]*	{}	1679987089595	1679987089595	0	b78h88gsstbnfjk1tujcf6fx4ww	system	0	system
af5c4op43obb7tqxudrsj3ymcxr	2023-03-28 07:04:49.606503+00	cs6kzm7ejcfrk5coxkgj8kmez7y	1	text	## Description\n*[Brief description of this task]*\n\n## Requirements\n- *[Requirement 1]*\n- *[Requirement 2]*\n- ...	{}	1679987089608	1679987089608	0	b78h88gsstbnfjk1tujcf6fx4ww	system	0	system
7qga75o3hmfgjjkqs6mk6px5imo	2023-03-28 07:04:49.6199+00	cfefgwjke6bbxpjpig618g9bpte	1	image		{"fileId":"7pbp4qg415pbstc6enzeicnu3qh.png"}	1679987089622	1679987089622	0	b78h88gsstbnfjk1tujcf6fx4ww	system	0	system
adtm1rmkxuigedcr1idmgkrszkr	2023-03-28 07:04:49.632857+00	cfefgwjke6bbxpjpig618g9bpte	1	text	## Steps to reproduce the behavior\n\n1. Go to ...\n2. Select  ...\n3. Scroll down to ...\n4. See error\n\n## Expected behavior\n\nA clear and concise description of what you expected to happen.\n\n## Edition and Platform\n\n - Edition: Personal Desktop / Personal Server / Mattermost plugin\n - Version: [e.g. v0.9.0]\n - Browser and OS: [e.g. Chrome 91 on macOS, Edge 93 on Windows]\n\n## Additional context\n\nAdd any other context about the problem here.	{}	1679987089635	1679987089635	0	b78h88gsstbnfjk1tujcf6fx4ww	system	0	system
ac8taob8yatyminhosfzxrdigcr	2023-03-28 07:04:49.646674+00	cy3nctg5wpibmzmor5poce41zey	1	text	## Description\n*[Brief description of this task]*\n\n## Requirements\n- *[Requirement 1]*\n- *[Requirement 2]*\n- ...	{}	1679987089649	1679987089649	0	b78h88gsstbnfjk1tujcf6fx4ww	system	0	system
aunwt31xs3fbr8xkt9ou9fwk11o	2023-03-28 07:04:49.660221+00	cidz4imnqhir48brz6e8hxhfrhy	1	text	## Requirements\n- [Requirement 1]\n- [Requirement 2]\n- ...	{}	1679987089662	1679987089662	0	b78h88gsstbnfjk1tujcf6fx4ww	system	0	system
788eckchipbb4brzk6nanuy8khh	2023-03-28 07:04:49.674041+00	co14yqycektdm5fofehfhmcidio	1	image		{"fileId":"7pbp4qg415pbstc6enzeicnu3qh.png"}	1679987089676	1679987089676	0	b78h88gsstbnfjk1tujcf6fx4ww	system	0	system
a5qexpks9ppb1z8fosmhaai4nmw	2023-03-28 07:04:49.690873+00	co14yqycektdm5fofehfhmcidio	1	text	## Steps to reproduce the behavior\n1. Go to ...\n2. Select  ...\n3. Scroll down to ...\n4. See error\n\n## Expected behavior\n*[A clear and concise description of what you expected to happen.]*\n\n## Edition and Platform\n- Edition: *[e.g. Personal Desktop / Personal Server / Mattermost plugin]*\n- Version: *[e.g. v0.9.0]*\n- Browser and OS: *[e.g. Chrome 91 on macOS, Edge 93 on Windows]*\n\n## Additional context\n*[Add any other context about the problem here.]*	{}	1679987089693	1679987089693	0	b78h88gsstbnfjk1tujcf6fx4ww	system	0	system
a461wufdjair8z87pk7ope74pic	2023-03-28 07:04:49.704741+00	cwrq9ag3p5pgzzy98nfd3wwra1w	1	text	## Summary\n[Brief description of what this epic is about]\n\n## Motivation\n[Brief description on why this is needed]\n\n## Acceptance Criteria\n - [Criteron 1]\n - [Criteron 2]\n - ...\n\n## Personas\n - [Persona A]\n - [Persona B]\n - ...\n\n## Reference Materials\n - [Links to other relevant documents as needed]\n - ...	{}	1679987089706	1679987089706	0	b78h88gsstbnfjk1tujcf6fx4ww	system	0	system
cu6e93kj3ot8ddyp41nw9n6xb4c	2023-03-28 07:04:49.743188+00	bo3c5m3q7ftfi5rugbfu3mbnriy	1	card	Drag cards	{"contentOrder":["apktbgtee5jb8xrnqy3ibiujxew","a8d1k93tg57fd3cnm9f9h8wtfry"],"icon":"🤏","isTemplate":false,"properties":{"a4nfnb5xr3txr5xq7y9ho7kyz6c":"https://docs.mattermost.com/boards/working-with-boards.html#dragging-cards","a972dc7a-5f4c-45d2-8044-8c28c69717f1":"ajurey3xkocs1nwx8di5zx6oe7o","acypkejeb5yfujhj9te57p9kaxw":"aq6ukoiciyfctgwyhwzpfss8ghe"}}	1679987089745	1679987089745	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
cy49f33jeqfnjdmnkzxnfdzm1jh	2023-03-28 07:04:49.756485+00	bo3c5m3q7ftfi5rugbfu3mbnriy	1	card	Create your own board	{"contentOrder":["a5j5ibzpnitfqtywpfpjgfbg96e","anek6hsqm33bj8f9y3ygp4ghcyc","7r9my1yuddbn45dojrfht3neg8c","7eir5gdjxgjbsxpbyp3df4npcze","74kwi7z6qetycu835ykqwkxnrgh"],"icon":"📋","isTemplate":false,"properties":{"a4nfnb5xr3txr5xq7y9ho7kyz6c":"https://docs.mattermost.com/boards/working-with-boards.html#adding-new-boards","a972dc7a-5f4c-45d2-8044-8c28c69717f1":"amm6wfhnbuxojwssyftgs9dipqe","acypkejeb5yfujhj9te57p9kaxw":"aanaehcw3m13jytujsjk5hpf6ry"}}	1679987089760	1679987089760	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
cnrfkt5my4bd1tc1kr96mpswoth	2023-03-28 07:04:49.772472+00	bo3c5m3q7ftfi5rugbfu3mbnriy	1	card	Create a new card	{"contentOrder":["az5tftnjy1t8umb8tz6qgqcpfky","adhsx4h5ss7rqdcjt8xyam6xtqc","a7hsidtoz1jntdyysth1typ5srh","7me9p46gbqiyfmfnapi7dyxb5br","76czpu8dsm7f13r11z14xagb91h"],"icon":"📝","isTemplate":false,"properties":{"a4nfnb5xr3txr5xq7y9ho7kyz6c":"https://docs.mattermost.com/boards/working-with-boards.html#adding-cards","a972dc7a-5f4c-45d2-8044-8c28c69717f1":"amm6wfhnbuxojwssyftgs9dipqe","acypkejeb5yfujhj9te57p9kaxw":"aanaehcw3m13jytujsjk5hpf6ry"}}	1679987089774	1679987089774	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
c76e7ad5khfrbpdwrd886b9zm5r	2023-03-28 07:04:49.785378+00	bo3c5m3q7ftfi5rugbfu3mbnriy	1	card	Filter and sort cards	{"contentOrder":["a4fz9kcfs9ibj8puk9mux7ac94c","a4kct76f3jjye8fqt9mxaqsecca","78i8aqjmqtibr7x4okhz6uqquqr","7b8oh8crm4iymjjum64robh6ywc"],"icon":"🎛️","isTemplate":false,"properties":{"a972dc7a-5f4c-45d2-8044-8c28c69717f1":"ajurey3xkocs1nwx8di5zx6oe7o","acypkejeb5yfujhj9te57p9kaxw":"aq6ukoiciyfctgwyhwzpfss8ghe"}}	1679987089787	1679987089787	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
aiz87msricjg4bkjgrs99o44u6r	2023-03-28 07:04:49.698046+00	cwrq9ag3p5pgzzy98nfd3wwra1w	1	text	## Summary\n*[Brief description of what this epic is about]*\n## Motivation\n*[Brief description on why this is needed]*\n## Acceptance Criteria\n- *[Criteron 1]*\n- *[Criteron 2]*\n- ...\n## Personas\n- *[Persona A]*\n- *[Persona B]*\n- ...\n## Reference Materials\n- *[Links to other relevant documents as needed]*\n- ...	{}	1679987089700	1679987089700	0	b78h88gsstbnfjk1tujcf6fx4ww	system	0	system
bo3c5m3q7ftfi5rugbfu3mbnriy	2023-03-28 07:04:49.736724+00		1	board	Welcome to Boards!	{"cardProperties":[{"id":"a972dc7a-5f4c-45d2-8044-8c28c69717f1","name":"Status","options":[{"color":"propColorRed","id":"amm6wfhnbuxojwssyftgs9dipqe","value":"To do 🔥"},{"color":"propColorYellow","id":"af3p8ztcyxgn8wd9z4az7o9tjeh","value":"Next up"},{"color":"propColorPurple","id":"ajurey3xkocs1nwx8di5zx6oe7o","value":"Later"},{"color":"propColorGreen","id":"agkinkjy5983wsk6kppsujajxqw","value":"Completed 🙌"}],"type":"select"},{"id":"acypkejeb5yfujhj9te57p9kaxw","name":"Priority","options":[{"color":"propColorOrange","id":"aanaehcw3m13jytujsjk5hpf6ry","value":"1. High"},{"color":"propColorBrown","id":"ascd7nm9r491ayot8i86g1gmgqw","value":"2. Medium"},{"color":"propColorGray","id":"aq6ukoiciyfctgwyhwzpfss8ghe","value":"3. Low"}],"type":"select"},{"id":"aqh13jabwexjkzr3jqsz1i1syew","name":"Assignee","options":[],"type":"person"},{"id":"acmg7mz1rr1eykfug4hcdpb1y1o","name":"Due Date","options":[],"type":"date"},{"id":"amewjwfjrtpu8ha73xsrdmxazxr","name":"Reviewed","options":[],"type":"checkbox"},{"id":"attzzboqaz6m1sdti5xa7gjnk1e","name":"Last updated time","options":[],"type":"updatedTime"},{"id":"a4nfnb5xr3txr5xq7y9ho7kyz6c","name":"Reference","options":[],"type":"url"},{"id":"a9gzwi3dt5n55nddej6zcbhxaeh","name":"Created by","options":[],"type":"createdBy"}],"description":"Mattermost Boards is an open source project management tool that helps you organize, track, and manage work across teams. Select a card to learn more.","icon":"👋","isTemplate":true,"showDescription":true,"templateVer":4,"trackingTemplateId":"65aba997282f3ac457cd66736fb86915"}	1679987089739	1679987089739	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
cxxmymfyz8jy5zjh7ztrrzwurrw	2023-03-28 07:04:49.749292+00	bo3c5m3q7ftfi5rugbfu3mbnriy	1	card	Manage tasks with cards	{"contentOrder":["arfz9nncktin3ugxo1r4kytk33a","7io4zth6i7bnmuedkzzj1esnccr","7r9swbgsqqi81trzhkrdcffza5e","784uu3ufcgb878ky7hyugmf6xcw","7coxm5spwi78yjyh3zx3nmeqsih","7jfwnhpbb6ffa7pougdnig6usoo","7kz19ojodoi8u5kum6fa7e1zhue","7nb8y7jyoetro8cd36qcju53z8c","7bffmpsfmhtfkzfpnykb9u8iyaa","75dhykawd3ig5megxae5btokane","76nwb9tqfsid5jx46yw34itqima","7dy3mcgzgybf1ifa3emgewkzj7e","a5ca6tii33bfw8ba36y1rswq3he","7876od6xhffr6fy69zeogag7eyw","7x7bq9awkatbm5x4docbh5gaw4y","7ghpx9qff43dgtke1rwidmge1ho","7nb8y7jyoetro8cd36qcju53z8c","7hdyxemhbytfm3m83g88djq9nhr","7pgnejxokubbe9kdrxj6g9qa41e","7hw9z6qtx8jyizkmm9g5yq3gxcy","7gk6ooz6npbb8by5rgp9aig7tua","7b8xbi67z77bh8xb996omw1pipo"],"icon":"☑️","isTemplate":false,"properties":{"a4nfnb5xr3txr5xq7y9ho7kyz6c":"https://docs.mattermost.com/boards/work-with-cards.html","a972dc7a-5f4c-45d2-8044-8c28c69717f1":"amm6wfhnbuxojwssyftgs9dipqe","acypkejeb5yfujhj9te57p9kaxw":"aanaehcw3m13jytujsjk5hpf6ry"}}	1679987089751	1679987089751	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
cgbf53bt1g3byzmh6ge184mmjah	2023-03-28 07:04:49.765838+00	bo3c5m3q7ftfi5rugbfu3mbnriy	1	card	Share a board	{"contentOrder":["az8mnwbjz93dqmy1apef3mt4r3c","a8s5nabkwotystb5976io4q5dxa","7r7asyew8d7fyunf4sow8e5iyoc","ad8j3n8tp77bppee3ipjt6odgpe","7w935usqt6pby8qz9x5pxaj7iow","7ogbs8h6q4j8z7ngy1m7eag63nw","7z1jau5qy3jfcxdp5cgq3duk6ne","78a1nnh1cztb47fj7t74bownrjh"],"icon":"📤","isTemplate":false,"properties":{"a4nfnb5xr3txr5xq7y9ho7kyz6c":"https://docs.mattermost.com/boards/sharing-boards.html","a972dc7a-5f4c-45d2-8044-8c28c69717f1":"ajurey3xkocs1nwx8di5zx6oe7o","acypkejeb5yfujhj9te57p9kaxw":"aq6ukoiciyfctgwyhwzpfss8ghe"}}	1679987089768	1679987089768	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
c7edyrpyqabdapxeej435xsx47o	2023-03-28 07:04:49.778647+00	bo3c5m3q7ftfi5rugbfu3mbnriy	1	card	Share cards on Channels	{"contentOrder":["aici8woqkp7nn3nn88kzoms45we","atfx41xk1zbg4fenh3rcdgin9qa","af7564ujkhjrptd468byt14umbh","739yug5ifrbrfzqib8y93exdn8y"],"icon":"📮","isTemplate":false,"properties":{"a4nfnb5xr3txr5xq7y9ho7kyz6c":"https://docs.mattermost.com/boards/work-with-cards.html#share-card-previews","a972dc7a-5f4c-45d2-8044-8c28c69717f1":"af3p8ztcyxgn8wd9z4az7o9tjeh","acypkejeb5yfujhj9te57p9kaxw":"ascd7nm9r491ayot8i86g1gmgqw"}}	1679987089780	1679987089780	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
citptykyoit88fm5qsfg7xszihy	2023-03-28 07:04:49.792511+00	bo3c5m3q7ftfi5rugbfu3mbnriy	1	card	Create a new view	{"contentOrder":["aozbezukpgif3jpbsq7tahmmp5e","ajguxrm3gn7n98qhnhbhe5zgzzy","7owai1ux3h3gtf8byynfk6hyx1c","7n8jq1dizyfgotby3o91arf1hxh","77y4wffj1ctg7xmm9bx45qn6q6o","7w7o1f3k3ojrk3yapgdt1mwzeyh"],"icon":"👓","isTemplate":false,"properties":{"a4nfnb5xr3txr5xq7y9ho7kyz6c":"https://docs.mattermost.com/boards/working-with-boards.html#adding-new-views","a972dc7a-5f4c-45d2-8044-8c28c69717f1":"af3p8ztcyxgn8wd9z4az7o9tjeh","acypkejeb5yfujhj9te57p9kaxw":"ascd7nm9r491ayot8i86g1gmgqw"}}	1679987089795	1679987089794	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
c5fcc73fqfjrkzk7za7ifbaqg8a	2023-03-28 07:04:49.805333+00	bo3c5m3q7ftfi5rugbfu3mbnriy	1	card	@mention teammates	{"contentOrder":["aaba3kq539iymjrn3at6cfjnigo","auztpruyts7nq7xcf9uooz414da","7mbw9t71hjbrydgzgkqqaoh8usr","7gg515mdfgfnzzycihf3b381rwo"],"icon":"🔔","isTemplate":false,"properties":{"a4nfnb5xr3txr5xq7y9ho7kyz6c":"https://docs.mattermost.com/boards/work-with-cards.html#mention-people","a972dc7a-5f4c-45d2-8044-8c28c69717f1":"ajurey3xkocs1nwx8di5zx6oe7o","acypkejeb5yfujhj9te57p9kaxw":"aq6ukoiciyfctgwyhwzpfss8ghe"}}	1679987089807	1679987089807	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
vqb6snmt9x7bm7qwxyeu5fziear	2023-03-28 07:04:49.818074+00	bo3c5m3q7ftfi5rugbfu3mbnriy	1	view	Preview: Calendar View	{"cardOrder":[],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{},"dateDisplayPropertyId":"acmg7mz1rr1eykfug4hcdpb1y1o","defaultTemplateId":"","filter":{"filters":[],"operation":"and"},"hiddenOptionIds":[],"kanbanCalculations":{},"sortOptions":[],"viewType":"calendar","visibleOptionIds":[],"visiblePropertyIds":["__title"]}	1679987089820	1679987089820	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
vxzxzj3mkhfrw38w9e6f35g378c	2023-03-28 07:04:49.830468+00	bo3c5m3q7ftfi5rugbfu3mbnriy	1	view	Onboarding	{"cardOrder":["cnrfkt5my4bd1tc1kr96mpswoth","cxxmymfyz8jy5zjh7ztrrzwurrw","cy49f33jeqfnjdmnkzxnfdzm1jh","c7edyrpyqabdapxeej435xsx47o","ctrhjtasucjnuikt79m8xzumroh","citptykyoit88fm5qsfg7xszihy","c5fcc73fqfjrkzk7za7ifbaqg8a","cu6e93kj3ot8ddyp41nw9n6xb4c","cgbf53bt1g3byzmh6ge184mmjah","c76e7ad5khfrbpdwrd886b9zm5r"],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{},"defaultTemplateId":"","filter":{"filters":[],"operation":"and"},"groupById":"a972dc7a-5f4c-45d2-8044-8c28c69717f1","hiddenOptionIds":[""],"kanbanCalculations":{},"sortOptions":[],"viewType":"board","visibleOptionIds":["aqb5x3pt87dcc9stbk4ofodrpoy","a1mtm777bkagq3iuu7xo9b13qfr","auxbwzptiqzkii5r61uz3ndsy1r","aj9386k1bx8qwmepeuxg3b7z4pw"],"visiblePropertyIds":[]}	1679987089832	1679987089832	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
7coxm5spwi78yjyh3zx3nmeqsih	2023-03-28 07:04:49.843427+00	cxxmymfyz8jy5zjh7ztrrzwurrw	1	checkbox	Assign tasks to teammates	{"value":false}	1679987089845	1679987089845	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
7jfwnhpbb6ffa7pougdnig6usoo	2023-03-28 07:04:49.856433+00	cxxmymfyz8jy5zjh7ztrrzwurrw	1	checkbox	Add and update descriptions with Markdown	{"value":false}	1679987089858	1679987089858	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
ctrhjtasucjnuikt79m8xzumroh	2023-03-28 07:04:49.798819+00	bo3c5m3q7ftfi5rugbfu3mbnriy	1	card	Add new properties	{"contentOrder":["abrc6chybjfrydphtazzbt7zpmc","ayhk11qsuz789fk8bqae4oz8mro","7gc3z8cf8rirgfyutwoke9nn6jy","76cinqnb6k3dzmfbm9fnc8eofny","7npp1dsnidjbdprcp6dcjny3zbo"],"icon":"🏷️","isTemplate":false,"properties":{"a4nfnb5xr3txr5xq7y9ho7kyz6c":"https://docs.mattermost.com/boards/work-with-cards.html#add-and-manage-properties","a972dc7a-5f4c-45d2-8044-8c28c69717f1":"af3p8ztcyxgn8wd9z4az7o9tjeh","acypkejeb5yfujhj9te57p9kaxw":"ascd7nm9r491ayot8i86g1gmgqw"}}	1679987089801	1679987089801	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
vr886whugfjrn8xwb1qj4rfdegy	2023-03-28 07:04:49.811711+00	bo3c5m3q7ftfi5rugbfu3mbnriy	1	view	Preview: Table View	{"cardOrder":[],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{"__title":280,"a972dc7a-5f4c-45d2-8044-8c28c69717f1":100,"acypkejeb5yfujhj9te57p9kaxw":169},"defaultTemplateId":"","filter":{"filters":[],"operation":"and"},"hiddenOptionIds":[],"kanbanCalculations":{},"sortOptions":[],"viewType":"table","visibleOptionIds":[],"visiblePropertyIds":["a972dc7a-5f4c-45d2-8044-8c28c69717f1","aqh13jabwexjkzr3jqsz1i1syew","acmg7mz1rr1eykfug4hcdpb1y1o","acypkejeb5yfujhj9te57p9kaxw"]}	1679987089814	1679987089814	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
v5s58k3uw5jyxm8abg8q99nu19y	2023-03-28 07:04:49.824113+00	bo3c5m3q7ftfi5rugbfu3mbnriy	1	view	Preview: Gallery View	{"cardOrder":[],"collapsedOptionIds":[],"columnCalculations":{},"columnWidths":{},"defaultTemplateId":"","filter":{"filters":[],"operation":"and"},"hiddenOptionIds":[],"kanbanCalculations":{},"sortOptions":[],"viewType":"gallery","visibleOptionIds":[],"visiblePropertyIds":["__title"]}	1679987089826	1679987089826	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
a8d1k93tg57fd3cnm9f9h8wtfry	2023-03-28 07:04:49.836979+00	cu6e93kj3ot8ddyp41nw9n6xb4c	1	text	Mattermost Boards makes it easy for you to update certain properties on cards through our drag and drop functionality. Simply drag this card from the **Later** column to the **Completed** column to automatically update the status and mark this task as complete.	{}	1679987089839	1679987089839	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
7b8xbi67z77bh8xb996omw1pipo	2023-03-28 07:04:49.850145+00	cxxmymfyz8jy5zjh7ztrrzwurrw	1	checkbox	Create and manage checklists, like this one... :)	{"value":false}	1679987089852	1679987089852	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
7bffmpsfmhtfkzfpnykb9u8iyaa	2023-03-28 07:04:49.863106+00	cxxmymfyz8jy5zjh7ztrrzwurrw	1	checkbox	Follow cards to get notified on the latest updates	{"value":false}	1679987089865	1679987089865	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
7kz19ojodoi8u5kum6fa7e1zhue	2023-03-28 07:04:49.876897+00	cxxmymfyz8jy5zjh7ztrrzwurrw	1	checkbox	Provide feedback and ask questions via comments	{"value":false}	1679987089879	1679987089879	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
7r9swbgsqqi81trzhkrdcffza5e	2023-03-28 07:04:49.890715+00	cxxmymfyz8jy5zjh7ztrrzwurrw	1	checkbox	Manage deadlines and milestones	{"value":false}	1679987089893	1679987089893	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
74kwi7z6qetycu835ykqwkxnrgh	2023-03-28 07:04:49.904152+00	cy49f33jeqfnjdmnkzxnfdzm1jh	1	image		{"fileId":"74uia99m9btr8peydw7oexn37tw.gif"}	1679987089906	1679987089906	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
anek6hsqm33bj8f9y3ygp4ghcyc	2023-03-28 07:04:49.916108+00	cy49f33jeqfnjdmnkzxnfdzm1jh	1	text	To create your own board, select the "+" on the top of the left hand sidebar. Choose from one of our standard templates and see how they can help you get started with your next project:\n\n- **Project Tasks**: Stay on top of your project tasks, track progress, and set priorities. \n- **Meeting Agenda**: Set your meeting agendas for recurring team meetings and 1:1s.\n- **Roadmap**: Plan your roadmap and manage your releases more efficiently.\n- **Personal Tasks**: Organize your life and track your personal tasks.\n- **Content Calendar**: Plan your editorial content, assign work, and track deadlines.\n- **Personal Goals**: Set and accomplish new personal goals and milestones.	{}	1679987089918	1679987089918	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
az8mnwbjz93dqmy1apef3mt4r3c	2023-03-28 07:04:49.928636+00	cgbf53bt1g3byzmh6ge184mmjah	1	text	Keep stakeholders and customers up-to-date on project progress by sharing your board.	{}	1679987089930	1679987089930	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
76czpu8dsm7f13r11z14xagb91h	2023-03-28 07:04:49.941394+00	cnrfkt5my4bd1tc1kr96mpswoth	1	image		{"fileId":"7iw4rxx7jj7bypmdotd9z469cyh.png"}	1679987089943	1679987089943	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
az5tftnjy1t8umb8tz6qgqcpfky	2023-03-28 07:04:49.954994+00	cnrfkt5my4bd1tc1kr96mpswoth	1	text	Mattermost Boards helps you manage and track all your project tasks with **Cards**.	{}	1679987089957	1679987089957	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
af7564ujkhjrptd468byt14umbh	2023-03-28 07:04:49.967294+00	c7edyrpyqabdapxeej435xsx47o	1	text	After you've copied the link, paste it into any channel or Direct Message to share the card. A preview of the card will display within the channel with a link back to the card on Boards.	{}	1679987089969	1679987089969	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
aici8woqkp7nn3nn88kzoms45we	2023-03-28 07:04:49.9805+00	c7edyrpyqabdapxeej435xsx47o	1	text	Cards can be linked and shared with teammates directly on Channels. Card previews are displayed when shared on Channels, so your team can discuss work items and get the relevant context without having to switch over to Boards.	{}	1679987089982	1679987089982	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
a4kct76f3jjye8fqt9mxaqsecca	2023-03-28 07:04:49.993291+00	c76e7ad5khfrbpdwrd886b9zm5r	1	text	Organize and find the cards you're looking for with our filter, sort, and grouping options. From the Board header, you can quickly toggle on different properties, change the group display, set filters, and change how the cards are sorted.	{}	1679987089995	1679987089995	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
ajguxrm3gn7n98qhnhbhe5zgzzy	2023-03-28 07:04:50.00588+00	citptykyoit88fm5qsfg7xszihy	1	text	Views allow your team to visualize the same cards and data from different perspectives, so they can stay up-to-date in the way that works best for them. To add a new view, go to **Add a new view** from the view drop-down, then select from any of the following views:\n\n- **Board**: Adds a Kanban board, similar to this one, that allows your team to organize cards in swimlanes grouped by any property of your choosing. This view helps you visualize your project progress.\n- **Table**: Displays cards in a table format with rows and columns. Use this view to get an overview of all your project tasks. Easily view and compare the state of all properties across all cards without needing to open individual cards.\n- **Gallery**: Displays cards in a gallery format, so you can manage and organize cards with image attachments.\n- **Calendar**: Adds a calendar view to easily visualize your cards by dates and keep track of deadlines.	{}	1679987090008	1679987090008	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
75dhykawd3ig5megxae5btokane	2023-03-28 07:04:49.883684+00	cxxmymfyz8jy5zjh7ztrrzwurrw	1	checkbox	@mention teammates so they can follow, and collaborate on, comments and descriptions	{"value":false}	1679987089886	1679987089886	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
arfz9nncktin3ugxo1r4kytk33a	2023-03-28 07:04:49.897517+00	cxxmymfyz8jy5zjh7ztrrzwurrw	1	text	Cards allow your entire team to manage and collaborate on a task in one place. Within a card, your team can:	{}	1679987089899	1679987089899	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
a5j5ibzpnitfqtywpfpjgfbg96e	2023-03-28 07:04:49.910143+00	cy49f33jeqfnjdmnkzxnfdzm1jh	1	text	A board helps you manage your project, organize tasks, and collaborate with your team all in one place.	{}	1679987089912	1679987089912	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
78a1nnh1cztb47fj7t74bownrjh	2023-03-28 07:04:49.922372+00	cgbf53bt1g3byzmh6ge184mmjah	1	image		{"fileId":"7knxbyuiedtdafcgmropgkrtybr.gif"}	1679987089924	1679987089924	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
a8s5nabkwotystb5976io4q5dxa	2023-03-28 07:04:49.934913+00	cgbf53bt1g3byzmh6ge184mmjah	1	text	To share a board, select **Share** at the top right of the Board view. Copy the link to share the board internally with your team or generate public link that can be accessed by anyone externally.	{}	1679987089937	1679987089937	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
a7hsidtoz1jntdyysth1typ5srh	2023-03-28 07:04:49.947992+00	cnrfkt5my4bd1tc1kr96mpswoth	1	text	To create a new card, simply do any of the following:\n- Select "**New**" on the top right header\n- Select "**+ New**" below any column\n- Select "**+**" to the right of any columnn header	{}	1679987089950	1679987089950	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
739yug5ifrbrfzqib8y93exdn8y	2023-03-28 07:04:49.961352+00	c7edyrpyqabdapxeej435xsx47o	1	image		{"fileId":"7ek6wbpp19jfoujs1goh6kttbby.gif"}	1679987089963	1679987089963	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
atfx41xk1zbg4fenh3rcdgin9qa	2023-03-28 07:04:49.973982+00	c7edyrpyqabdapxeej435xsx47o	1	text	To share a card, you'll need to copy the card link first. You can:\n\n- Open a card and select the options menu button at the top right of the card.\n- Open the board view and hover your mouse over any card to access the options menu button.	{}	1679987089976	1679987089976	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
7b8oh8crm4iymjjum64robh6ywc	2023-03-28 07:04:49.986959+00	c76e7ad5khfrbpdwrd886b9zm5r	1	image		{"fileId":"7dybb6t8fj3nrdft7nerhuf784y.png"}	1679987089989	1679987089989	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
7w7o1f3k3ojrk3yapgdt1mwzeyh	2023-03-28 07:04:49.999202+00	citptykyoit88fm5qsfg7xszihy	1	image		{"fileId":"78jws5m1myf8pufewzkaa6i11sc.gif"}	1679987090001	1679987090001	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
7npp1dsnidjbdprcp6dcjny3zbo	2023-03-28 07:04:50.012608+00	ctrhjtasucjnuikt79m8xzumroh	1	image		{"fileId":"7d6hrtig3zt8f9cnbo1um5oxx3y.gif"}	1679987090015	1679987090015	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
7gg515mdfgfnzzycihf3b381rwo	2023-03-28 07:04:50.02572+00	c5fcc73fqfjrkzk7za7ifbaqg8a	1	image		{"fileId":"74nt9eqzea3ydjjpgjtsxcjgrxc.gif"}	1679987090028	1679987090028	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
aaba3kq539iymjrn3at6cfjnigo	2023-03-28 07:04:50.038331+00	c5fcc73fqfjrkzk7za7ifbaqg8a	1	text	Collaborate with teammates directly on each card using @mentions and have all the relevant context in one place.	{}	1679987090041	1679987090041	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
abrc6chybjfrydphtazzbt7zpmc	2023-03-28 07:04:50.019458+00	ctrhjtasucjnuikt79m8xzumroh	1	text	Customize cards to fit your needs and track the information most important to you. Boards supports a wide range of fully customizable property types. For example, you can:\n- Use the **Date** property for things like deadlines or milestones.\n- Assign owners to tasks with the **Person** property.\n- Define statuses and priorities with the **Select** property.\n- Create tags with the **Multi Select** property.\n- Link cards to webpages with the **URL** property.	{}	1679987090021	1679987090021	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
auztpruyts7nq7xcf9uooz414da	2023-03-28 07:04:50.031925+00	c5fcc73fqfjrkzk7za7ifbaqg8a	1	text	To mention a teammate use the **@ symbol with their username** in the comments or description section. They'll get a Direct Message notification via Channels and also be added as a [follower](https://docs.mattermost.com/boards/work-with-cards.html#receive-updates) to the card. \n\nWhenever any changes are made to the card, they'll automatically get notified on Channels.	{}	1679987090034	1679987090034	0	bo3c5m3q7ftfi5rugbfu3mbnriy	system	0	system
\.


--
-- Data for Name: focalboard_file_info; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.focalboard_file_info (id, create_at, delete_at, name, extension, size, archived) FROM stdin;
\.


--
-- Data for Name: focalboard_notification_hints; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.focalboard_notification_hints (block_type, block_id, workspace_id, modified_by_id, create_at, notify_at) FROM stdin;
\.


--
-- Data for Name: focalboard_schema_migrations; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.focalboard_schema_migrations (version, dirty) FROM stdin;
17	f
\.


--
-- Data for Name: focalboard_sessions; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.focalboard_sessions (id, token, user_id, props, create_at, update_at, auth_service) FROM stdin;
\.


--
-- Data for Name: focalboard_sharing; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.focalboard_sharing (id, enabled, token, modified_by, update_at, workspace_id) FROM stdin;
\.


--
-- Data for Name: focalboard_subscriptions; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.focalboard_subscriptions (block_type, block_id, workspace_id, subscriber_type, subscriber_id, notified_at, create_at, delete_at) FROM stdin;
\.


--
-- Data for Name: focalboard_system_settings; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.focalboard_system_settings (id, value) FROM stdin;
UniqueIDsMigrationComplete	true
TelemetryID	7t1a4y44g7pfw3bmc6kws378e6h
\.


--
-- Data for Name: focalboard_users; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.focalboard_users (id, username, email, password, mfa_secret, auth_service, auth_data, props, create_at, update_at, delete_at) FROM stdin;
\.


--
-- Data for Name: focalboard_workspaces; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.focalboard_workspaces (id, signup_token, settings, modified_by, update_at) FROM stdin;
\.


--
-- Data for Name: groupchannels; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.groupchannels (groupid, autoadd, schemeadmin, createat, deleteat, updateat, channelid) FROM stdin;
\.


--
-- Data for Name: groupmembers; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.groupmembers (groupid, userid, createat, deleteat) FROM stdin;
\.


--
-- Data for Name: groupteams; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.groupteams (groupid, autoadd, schemeadmin, createat, deleteat, updateat, teamid) FROM stdin;
\.


--
-- Data for Name: incomingwebhooks; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.incomingwebhooks (id, createat, updateat, deleteat, userid, channelid, teamid, displayname, description, username, iconurl, channellocked) FROM stdin;
\.


--
-- Data for Name: ir_channelaction; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.ir_channelaction (id, channelid, enabled, deleteat, actiontype, triggertype, payload) FROM stdin;
\.


--
-- Data for Name: ir_db_migrations; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.ir_db_migrations (version, name) FROM stdin;
1	create_IR_system
2	create_IR_incident
\.


--
-- Data for Name: ir_incident; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.ir_incident (id, name, description, isactive, commanderuserid, teamid, channelid, createat, endat, deleteat, activestage, postid, playbookid, checklistsjson, activestagetitle, reminderpostid, broadcastchannelid, previousreminder, remindermessagetemplate, currentstatus, reporteruserid, concatenatedinviteduserids, defaultcommanderid, announcementchannelid, concatenatedwebhookoncreationurls, concatenatedinvitedgroupids, retrospective, messageonjoin, retrospectivepublishedat, retrospectivereminderintervalseconds, retrospectivewascanceled, concatenatedwebhookonstatusupdateurls, laststatusupdateat, exportchannelonfinishedenabled, categorizechannelenabled, categoryname, concatenatedbroadcastchannelids, channelidtorootid, remindertimerdefaultseconds, statusupdateenabled, retrospectiveenabled, statusupdatebroadcastchannelsenabled, statusupdatebroadcastwebhooksenabled) FROM stdin;
\.


--
-- Data for Name: ir_metric; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.ir_metric (incidentid, metricconfigid, value, published) FROM stdin;
\.


--
-- Data for Name: ir_metricconfig; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.ir_metricconfig (id, playbookid, title, description, type, target, ordering, deleteat) FROM stdin;
\.


--
-- Data for Name: ir_playbook; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.ir_playbook (id, title, description, teamid, createpublicincident, createat, deleteat, checklistsjson, numstages, numsteps, broadcastchannelid, remindermessagetemplate, remindertimerdefaultseconds, concatenatedinviteduserids, inviteusersenabled, defaultcommanderid, defaultcommanderenabled, announcementchannelid, announcementchannelenabled, concatenatedwebhookoncreationurls, webhookoncreationenabled, concatenatedinvitedgroupids, messageonjoin, messageonjoinenabled, retrospectivereminderintervalseconds, retrospectivetemplate, concatenatedwebhookonstatusupdateurls, webhookonstatusupdateenabled, concatenatedsignalanykeywords, signalanykeywordsenabled, updateat, exportchannelonfinishedenabled, categorizechannelenabled, categoryname, concatenatedbroadcastchannelids, broadcastenabled, runsummarytemplate, channelnametemplate, statusupdateenabled, retrospectiveenabled, public, runsummarytemplateenabled) FROM stdin;
\.


--
-- Data for Name: ir_playbookautofollow; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.ir_playbookautofollow (playbookid, userid) FROM stdin;
\.


--
-- Data for Name: ir_playbookmember; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.ir_playbookmember (playbookid, memberid, roles) FROM stdin;
\.


--
-- Data for Name: ir_run_participants; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.ir_run_participants (userid, incidentid, isfollower) FROM stdin;
\.


--
-- Data for Name: ir_statusposts; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.ir_statusposts (incidentid, postid) FROM stdin;
\.


--
-- Data for Name: ir_system; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.ir_system (skey, svalue) FROM stdin;
DatabaseVersion	0.53.0
\.


--
-- Data for Name: ir_timelineevent; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.ir_timelineevent (id, incidentid, createat, deleteat, eventat, eventtype, summary, details, postid, subjectuserid, creatoruserid) FROM stdin;
\.


--
-- Data for Name: ir_userinfo; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.ir_userinfo (id, lastdailytododmat, digestnotificationsettingsjson) FROM stdin;
\.


--
-- Data for Name: ir_viewedchannel; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.ir_viewedchannel (channelid, userid) FROM stdin;
\.


--
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.jobs (id, type, priority, createat, startat, lastactivityat, status, progress, data) FROM stdin;
zdd58j8oitf8tfc9mnpfu8kqah	migrations	0	1679987147856	1679987156048	1679987156271	success	0	{"last_done": "{\\"current_table\\":\\"ChannelMembers\\",\\"last_team_id\\":\\"00000000000000000000000000\\",\\"last_channel_id\\":\\"00000000000000000000000000\\",\\"last_user\\":\\"00000000000000000000000000\\"}", "migration_key": "migration_advanced_permissions_phase_2"}
g7dka6c1abd3uqqhmb3xks1x6o	expiry_notify	0	1679987687884	1679987696140	1679987696146	success	0	null
\.


--
-- Data for Name: licenses; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.licenses (id, createat, bytes) FROM stdin;
\.


--
-- Data for Name: linkmetadata; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.linkmetadata (hash, url, "timestamp", type, data) FROM stdin;
\.


--
-- Data for Name: oauthaccessdata; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.oauthaccessdata (token, refreshtoken, redirecturi, clientid, userid, expiresat, scope) FROM stdin;
\.


--
-- Data for Name: oauthapps; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.oauthapps (id, creatorid, createat, updateat, clientsecret, name, description, callbackurls, homepage, istrusted, iconurl, mattermostappid) FROM stdin;
\.


--
-- Data for Name: oauthauthdata; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.oauthauthdata (clientid, userid, code, expiresin, createat, redirecturi, state, scope) FROM stdin;
\.


--
-- Data for Name: outgoingwebhooks; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.outgoingwebhooks (id, token, createat, updateat, deleteat, creatorid, channelid, teamid, triggerwords, callbackurls, displayname, contenttype, triggerwhen, username, iconurl, description) FROM stdin;
\.


--
-- Data for Name: pluginkeyvaluestore; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.pluginkeyvaluestore (pluginid, pkey, pvalue, expireat) FROM stdin;
com.mattermost.nps	ServerUpgrade-7.1.0	\\x7b227365727665725f76657273696f6e223a22372e312e30222c22757067726164655f6174223a22323032332d30332d32385430373a30343a34342e3132393436393430395a227d	0
com.mattermost.nps	Survey-7.1.0	\\x7b227365727665725f76657273696f6e223a22372e312e30222c226372656174655f6174223a22323032332d30332d32385430373a30343a34342e3132393436393430395a222c2273746172745f6174223a22323032332d30342d31385430373a30343a34342e3132393436393430395a227d	0
com.mattermost.plugin-channel-export	mmi_botid	\\x7a37337837337a3934746465336575347237716a386763377272	0
com.mattermost.apps	mmi_botid	\\x657262796562356b343372776d6d666734746b37357178357263	0
playbooks	mmi_botid	\\x6e77787a7379376a786667366962676b7a6536616f7164677077	0
focalboard	mmi_botid	\\x383662376374706b3169676e3871736372336673377a31337479	0
\.


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.posts (id, createat, updateat, deleteat, userid, channelid, rootid, originalid, message, type, props, hashtags, filenames, fileids, hasreactions, editat, ispinned, remoteid) FROM stdin;
\.


--
-- Data for Name: preferences; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.preferences (userid, category, name, value) FROM stdin;
fe4jgsubnidkirfqq8ym8i4ykw	tutorial_step	fe4jgsubnidkirfqq8ym8i4ykw	0
fe4jgsubnidkirfqq8ym8i4ykw	insights	insights_tutorial_state	{"insights_modal_viewed":true}
fe4jgsubnidkirfqq8ym8i4ykw	recommended_next_steps	hide	true
fe4jgsubnidkirfqq8ym8i4ykw	onboarding_task_list	onboarding_task_list_show	false
fe4jgsubnidkirfqq8ym8i4ykw	onboarding_task_list	onboarding_task_list_open	false
\.


--
-- Data for Name: productnoticeviewstate; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.productnoticeviewstate (userid, noticeid, viewed, "timestamp") FROM stdin;
fe4jgsubnidkirfqq8ym8i4ykw	use_case_survey	1	1679987543
fe4jgsubnidkirfqq8ym8i4ykw	june15-cloud-freemium	1	1679987543
fe4jgsubnidkirfqq8ym8i4ykw	desktop_upgrade_v5.2	1	1679987543
fe4jgsubnidkirfqq8ym8i4ykw	server_upgrade_v7.8	1	1679987543
fe4jgsubnidkirfqq8ym8i4ykw	crt-admin-disabled	1	1679987543
fe4jgsubnidkirfqq8ym8i4ykw	crt-admin-default_off	1	1679987543
fe4jgsubnidkirfqq8ym8i4ykw	crt-user-default-on	1	1679987543
fe4jgsubnidkirfqq8ym8i4ykw	crt-user-always-on	1	1679987543
fe4jgsubnidkirfqq8ym8i4ykw	v6.0_user_introduction	1	1679987543
fe4jgsubnidkirfqq8ym8i4ykw	v6.2_boards	1	1679987543
fe4jgsubnidkirfqq8ym8i4ykw	unsupported-server-v5.37	1	1679987543
\.


--
-- Data for Name: publicchannels; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.publicchannels (id, deleteat, teamid, displayname, name, header, purpose) FROM stdin;
\.


--
-- Data for Name: reactions; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.reactions (userid, postid, emojiname, createat, updateat, deleteat, remoteid, channelid) FROM stdin;
\.


--
-- Data for Name: recentsearches; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.recentsearches (userid, searchpointer, query, createat) FROM stdin;
\.


--
-- Data for Name: remoteclusters; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.remoteclusters (remoteid, remoteteamid, name, displayname, siteurl, createat, lastpingat, token, remotetoken, topics, creatorid) FROM stdin;
\.


--
-- Data for Name: retentionpolicies; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.retentionpolicies (id, displayname, postduration) FROM stdin;
\.


--
-- Data for Name: retentionpolicieschannels; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.retentionpolicieschannels (policyid, channelid) FROM stdin;
\.


--
-- Data for Name: retentionpoliciesteams; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.retentionpoliciesteams (policyid, teamid) FROM stdin;
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.roles (id, name, displayname, description, createat, updateat, deleteat, permissions, schememanaged, builtin) FROM stdin;
rco4bdh1rins583tre4dsxpjoe	run_admin	authentication.roles.run_admin.name	authentication.roles.run_admin.description	1679987075633	1679987077011	0	 run_manage_properties run_manage_members	t	t
4rsbr73ooff3pybjnnmp1dy1pe	system_read_only_admin	authentication.roles.system_read_only_admin.name	authentication.roles.system_read_only_admin.description	1679987075592	1679987076990	0	 sysconsole_read_environment_image_proxy sysconsole_read_integrations_gif sysconsole_read_experimental_bleve sysconsole_read_environment_session_lengths sysconsole_read_reporting_site_statistics list_private_teams sysconsole_read_environment_web_server sysconsole_read_authentication_signup sysconsole_read_environment_push_notification_server sysconsole_read_user_management_teams read_elasticsearch_post_aggregation_job sysconsole_read_site_customization read_audits sysconsole_read_site_announcement_banner read_public_channel sysconsole_read_reporting_server_logs test_ldap read_private_channel_groups sysconsole_read_site_users_and_teams sysconsole_read_site_posts sysconsole_read_experimental_features sysconsole_read_authentication_openid read_elasticsearch_post_indexing_job read_public_channel_groups get_analytics sysconsole_read_environment_database read_compliance_export_job sysconsole_read_environment_rate_limiting sysconsole_read_compliance_custom_terms_of_service sysconsole_read_site_file_sharing_and_downloads read_license_information read_data_retention_job sysconsole_read_about_edition_and_license sysconsole_read_authentication_ldap sysconsole_read_environment_smtp sysconsole_read_authentication_saml sysconsole_read_authentication_email sysconsole_read_integrations_bot_accounts sysconsole_read_integrations_integration_management sysconsole_read_authentication_mfa sysconsole_read_environment_developer sysconsole_read_authentication_guest_access read_ldap_sync_job sysconsole_read_environment_elasticsearch read_channel sysconsole_read_site_public_links view_team list_public_teams sysconsole_read_site_emoji sysconsole_read_compliance_data_retention_policy sysconsole_read_environment_logging read_other_users_teams sysconsole_read_environment_high_availability sysconsole_read_user_management_groups sysconsole_read_environment_performance_monitoring sysconsole_read_user_management_channels sysconsole_read_authentication_password sysconsole_read_user_management_permissions sysconsole_read_integrations_cors sysconsole_read_plugins sysconsole_read_compliance_compliance_export sysconsole_read_environment_file_storage sysconsole_read_user_management_users sysconsole_read_site_notifications sysconsole_read_compliance_compliance_monitoring sysconsole_read_experimental_feature_flags get_logs sysconsole_read_site_localization download_compliance_export_result sysconsole_read_reporting_team_statistics sysconsole_read_site_notices	f	t
knefz7bfh7gabfxgnnge3bjfcy	run_member	authentication.roles.run_member.name	authentication.roles.run_member.description	1679987075601	1679987076995	0	 run_view	t	t
cu4t49zciingxpbdu5oscxzj3y	team_post_all_public	authentication.roles.team_post_all_public.name	authentication.roles.team_post_all_public.description	1679987075612	1679987077001	0	 use_channel_mentions use_group_mentions create_post_public	f	t
ah6sw43kejnsum1tkyh1s8daur	system_admin	authentication.roles.global_admin.name	authentication.roles.global_admin.description	1679987075622	1679987077015	0	 assign_system_admin_role sysconsole_write_environment_developer read_ldap_sync_job manage_secure_connections view_team sysconsole_read_authentication_mfa sysconsole_write_environment_high_availability playbook_public_create playbook_private_manage_roles read_compliance_export_job playbook_private_manage_properties join_public_teams sysconsole_write_integrations_integration_management sysconsole_read_user_management_teams sysconsole_read_authentication_saml invalidate_email_invite manage_public_channel_properties create_bot create_emojis sysconsole_write_integrations_gif sysconsole_read_compliance_data_retention_policy sysconsole_read_site_localization sysconsole_write_authentication_guest_access sysconsole_write_integrations_cors sysconsole_write_site_public_links use_channel_mentions convert_public_channel_to_private read_other_users_teams import_team delete_post download_compliance_export_result read_license_information sysconsole_read_authentication_guest_access create_data_retention_job create_direct_channel sysconsole_write_site_users_and_teams sysconsole_read_authentication_ldap manage_public_channel_members sysconsole_read_reporting_site_statistics sysconsole_read_environment_elasticsearch sysconsole_write_authentication_saml test_email delete_emojis run_view sysconsole_read_user_management_groups sysconsole_read_environment_image_proxy read_elasticsearch_post_indexing_job manage_slash_commands sysconsole_read_user_management_channels create_post sysconsole_write_site_announcement_banner run_manage_members sysconsole_write_environment_rate_limiting invalidate_caches add_ldap_public_cert sysconsole_write_environment_image_proxy create_team sysconsole_read_integrations_gif manage_system_wide_oauth sysconsole_write_site_localization sysconsole_read_integrations_bot_accounts sysconsole_read_environment_logging delete_others_emojis sysconsole_write_plugins recycle_database_connections sysconsole_write_experimental_features purge_bleve_indexes sysconsole_read_reporting_team_statistics add_saml_public_cert sysconsole_read_about_edition_and_license use_group_mentions remove_ldap_private_cert create_post_ephemeral create_ldap_sync_job sysconsole_write_user_management_channels sysconsole_write_environment_logging manage_bots playbook_private_manage_members get_public_link sysconsole_write_environment_session_lengths sysconsole_write_reporting_site_statistics manage_private_channel_properties sysconsole_write_about_edition_and_license read_others_bots sysconsole_read_site_notifications sysconsole_read_reporting_server_logs delete_public_channel add_reaction delete_custom_group upload_file sysconsole_write_compliance_custom_terms_of_service create_custom_group manage_channel_roles manage_team_roles sysconsole_write_experimental_bleve sysconsole_write_site_posts sysconsole_read_site_file_sharing_and_downloads sysconsole_write_environment_push_notification_server sysconsole_read_authentication_openid manage_others_slash_commands test_ldap sysconsole_write_compliance_compliance_monitoring manage_team view_members sysconsole_read_environment_database sysconsole_read_environment_high_availability sysconsole_read_compliance_compliance_monitoring sysconsole_read_environment_web_server test_site_url sysconsole_write_authentication_email test_s3 sysconsole_read_environment_session_lengths edit_brand edit_custom_group list_public_teams sysconsole_write_experimental_feature_flags sysconsole_read_integrations_integration_management sysconsole_write_user_management_permissions sysconsole_write_environment_performance_monitoring invite_guest sysconsole_write_site_notices sysconsole_write_site_emoji test_elasticsearch sysconsole_write_authentication_password sysconsole_read_environment_smtp sysconsole_read_user_management_permissions manage_custom_group_members create_post_bleve_indexes_job sysconsole_read_user_management_users remove_reaction sysconsole_read_environment_rate_limiting invite_user edit_others_posts playbook_private_create sysconsole_write_environment_elasticsearch add_saml_private_cert sysconsole_write_user_management_system_roles run_create demote_to_guest sysconsole_read_billing create_compliance_export_job edit_other_users sysconsole_read_environment_developer playbook_public_manage_members promote_guest edit_post sysconsole_write_environment_web_server list_private_teams manage_oauth manage_outgoing_webhooks sysconsole_read_site_announcement_banner manage_incoming_webhooks manage_jobs sysconsole_write_user_management_groups playbook_public_manage_roles read_elasticsearch_post_aggregation_job purge_elasticsearch_indexes create_user_access_token sysconsole_read_site_customization sysconsole_read_experimental_bleve add_user_to_team run_manage_properties sysconsole_write_billing join_public_channels delete_others_posts remove_user_from_team sysconsole_read_environment_performance_monitoring playbook_public_manage_properties sysconsole_write_authentication_ldap manage_private_channel_members remove_ldap_public_cert add_saml_idp_cert revoke_user_access_token playbook_private_view join_private_teams sysconsole_write_reporting_team_statistics sysconsole_write_user_management_users manage_shared_channels sysconsole_read_site_posts read_jobs read_channel read_private_channel_groups sysconsole_write_site_customization manage_license_information sysconsole_write_authentication_openid sysconsole_read_user_management_system_roles sysconsole_read_environment_push_notification_server read_public_channel remove_saml_private_cert sysconsole_write_compliance_data_retention_policy read_data_retention_job manage_others_bots get_saml_metadata_from_idp sysconsole_write_environment_smtp manage_others_outgoing_webhooks sysconsole_write_user_management_teams use_slash_commands sysconsole_read_authentication_password sysconsole_write_environment_database read_public_channel_groups add_ldap_private_cert sysconsole_read_site_users_and_teams assign_bot convert_private_channel_to_public manage_roles sysconsole_write_authentication_mfa sysconsole_read_site_notices list_users_without_team sysconsole_write_site_notifications create_elasticsearch_post_indexing_job read_user_access_token remove_saml_public_cert create_post_public sysconsole_read_compliance_compliance_export create_elasticsearch_post_aggregation_job sysconsole_read_integrations_cors sysconsole_read_environment_file_storage sysconsole_write_environment_file_storage get_logs delete_private_channel sysconsole_read_authentication_signup read_bots get_saml_cert_status sysconsole_read_site_emoji get_analytics playbook_private_make_public manage_others_incoming_webhooks sysconsole_write_compliance_compliance_export sysconsole_write_reporting_server_logs sysconsole_read_experimental_feature_flags reload_config create_group_channel sysconsole_write_integrations_bot_accounts read_audits playbook_public_make_private create_public_channel remove_saml_idp_cert sysconsole_read_compliance_custom_terms_of_service sysconsole_read_authentication_email sysconsole_read_plugins sysconsole_write_site_file_sharing_and_downloads list_team_channels remove_others_reactions create_private_channel sysconsole_read_experimental_features sysconsole_read_site_public_links manage_system sysconsole_write_authentication_signup playbook_public_view	t	t
eoj4gfq5cff9pcaroqk3b1i5uc	playbook_member	authentication.roles.playbook_member.name	authentication.roles.playbook_member.description	1679987075615	1679987077003	0	 playbook_private_manage_properties run_create playbook_public_view playbook_public_manage_members playbook_public_manage_properties playbook_private_view playbook_private_manage_members	t	t
g7d6e1tpwinxmn8sza7xu7j3bw	team_user	authentication.roles.team_user.name	authentication.roles.team_user.description	1679987075596	1679987076991	0	 read_public_channel add_user_to_team playbook_public_create create_private_channel playbook_private_create invite_user list_team_channels join_public_channels view_team create_public_channel	t	t
k1q3m5hu1bbsu8pdhqe93y3bfh	system_guest	authentication.roles.global_guest.name	authentication.roles.global_guest.description	1679987075598	1679987076993	0	 create_group_channel create_direct_channel	t	t
b4bmsrmir7n8ic8czxzfc8y1dh	channel_user	authentication.roles.channel_user.name	authentication.roles.channel_user.description	1679987075603	1679987076996	0	 manage_public_channel_properties edit_post create_post read_private_channel_groups delete_private_channel delete_public_channel add_reaction read_channel manage_public_channel_members use_channel_mentions use_slash_commands manage_private_channel_members get_public_link upload_file read_public_channel_groups use_group_mentions manage_private_channel_properties delete_post remove_reaction	t	t
xroyxydcxjraxn9ypjc95b5pio	team_admin	authentication.roles.team_admin.name	authentication.roles.team_admin.description	1679987075606	1679987076998	0	 manage_public_channel_members manage_others_incoming_webhooks manage_private_channel_members delete_others_posts manage_team manage_team_roles read_private_channel_groups convert_private_channel_to_public import_team use_group_mentions manage_others_outgoing_webhooks create_post manage_incoming_webhooks manage_outgoing_webhooks remove_reaction add_reaction delete_post use_channel_mentions manage_channel_roles manage_others_slash_commands remove_user_from_team playbook_public_manage_roles convert_public_channel_to_private read_public_channel_groups manage_slash_commands playbook_private_manage_roles	t	t
azyt655tqff3mkgysd1xqhfhzr	team_guest	authentication.roles.team_guest.name	authentication.roles.team_guest.description	1679987075609	1679987077000	0	 view_team	t	t
d1yhcnqh4frdzxf39jwae617aa	custom_group_user	authentication.roles.custom_group_user.name	authentication.roles.custom_group_user.description	1679987075625	1679987077006	0		f	f
mhb6xboxi3rbf8xxzwqdcophoa	channel_admin	authentication.roles.channel_admin.name	authentication.roles.channel_admin.description	1679987075627	1679987077008	0	 use_group_mentions create_post remove_reaction manage_channel_roles manage_public_channel_members use_channel_mentions manage_private_channel_members add_reaction read_private_channel_groups read_public_channel_groups	t	t
rn51p6oh7bbu7r3dp6ehjdmi6e	playbook_admin	authentication.roles.playbook_admin.name	authentication.roles.playbook_admin.description	1679987075630	1679987077009	0	 playbook_public_manage_members playbook_public_manage_roles playbook_public_manage_properties playbook_private_manage_members playbook_private_manage_roles playbook_private_manage_properties playbook_public_make_private	t	t
o4mzshq6gpb9pm3jx81wqrtc6e	system_user	authentication.roles.global_user.name	authentication.roles.global_user.description	1679987075555	1679987077025	0	 create_emojis join_public_teams edit_custom_group create_custom_group create_direct_channel delete_emojis delete_custom_group list_public_teams create_group_channel create_team manage_custom_group_members view_members	t	t
x911t9a5ytr1xk8krskotsd65w	system_user_manager	authentication.roles.system_user_manager.name	authentication.roles.system_user_manager.description	1679987075584	1679987076988	0	 read_public_channel_groups convert_private_channel_to_public manage_public_channel_members sysconsole_read_user_management_permissions manage_team sysconsole_read_authentication_mfa sysconsole_read_user_management_channels join_private_teams convert_public_channel_to_private read_channel sysconsole_read_authentication_ldap remove_user_from_team delete_public_channel sysconsole_read_authentication_saml delete_private_channel sysconsole_read_authentication_signup sysconsole_read_authentication_password manage_private_channel_members manage_channel_roles add_user_to_team read_public_channel sysconsole_read_authentication_guest_access list_public_teams sysconsole_read_user_management_groups sysconsole_write_user_management_channels list_private_teams manage_team_roles manage_private_channel_properties sysconsole_read_authentication_openid join_public_teams sysconsole_write_user_management_teams sysconsole_read_user_management_teams sysconsole_write_user_management_groups view_team manage_public_channel_properties sysconsole_read_authentication_email test_ldap read_private_channel_groups read_ldap_sync_job	f	t
qjnr9wq95bbjbk4pkxp9pitzmr	system_post_all	authentication.roles.system_post_all.name	authentication.roles.system_post_all.description	1679987075636	1679987077017	0	 use_channel_mentions use_group_mentions create_post	f	t
ozzdxg8yajbobqcb7atx8kphqe	system_post_all_public	authentication.roles.system_post_all_public.name	authentication.roles.system_post_all_public.description	1679987075639	1679987077019	0	 create_post_public use_channel_mentions use_group_mentions	f	t
hjnys1kypiycf85t5z3bp88eqr	system_user_access_token	authentication.roles.system_user_access_token.name	authentication.roles.system_user_access_token.description	1679987075641	1679987077020	0	 create_user_access_token read_user_access_token revoke_user_access_token	f	t
zmgbqfyw6jdqbxxxmgpttrze7w	channel_guest	authentication.roles.channel_guest.name	authentication.roles.channel_guest.description	1679987075645	1679987077022	0	 add_reaction remove_reaction upload_file edit_post create_post use_channel_mentions use_slash_commands read_channel	t	t
rrtaexkptfd7jkry6cpeextpth	team_post_all	authentication.roles.team_post_all.name	authentication.roles.team_post_all.description	1679987075647	1679987077023	0	 use_channel_mentions create_post use_group_mentions	f	t
f5wei6h1b3r43ck1hssxt95cic	system_manager	authentication.roles.system_manager.name	authentication.roles.system_manager.description	1679987075618	1679987077005	0	 sysconsole_write_environment_web_server read_channel sysconsole_read_environment_developer read_private_channel_groups sysconsole_read_user_management_channels manage_channel_roles test_ldap sysconsole_read_authentication_email sysconsole_write_environment_file_storage sysconsole_write_environment_rate_limiting sysconsole_read_user_management_teams sysconsole_read_site_emoji sysconsole_write_user_management_permissions read_elasticsearch_post_indexing_job test_elasticsearch read_license_information manage_public_channel_members sysconsole_write_site_notices sysconsole_read_integrations_gif create_elasticsearch_post_indexing_job sysconsole_read_reporting_server_logs sysconsole_write_environment_database sysconsole_read_environment_push_notification_server sysconsole_read_environment_session_lengths sysconsole_read_environment_high_availability sysconsole_read_authentication_guest_access sysconsole_read_user_management_permissions test_email sysconsole_read_authentication_signup sysconsole_write_environment_push_notification_server sysconsole_write_site_users_and_teams sysconsole_write_environment_smtp sysconsole_read_site_notifications sysconsole_read_environment_web_server get_logs sysconsole_read_integrations_bot_accounts sysconsole_read_environment_rate_limiting delete_private_channel read_ldap_sync_job sysconsole_read_environment_logging sysconsole_read_site_file_sharing_and_downloads test_site_url sysconsole_write_site_announcement_banner sysconsole_read_environment_smtp sysconsole_read_site_notices sysconsole_read_environment_performance_monitoring sysconsole_write_site_localization sysconsole_read_site_announcement_banner reload_config manage_team_roles read_public_channel sysconsole_write_user_management_channels edit_brand manage_private_channel_members sysconsole_write_site_emoji sysconsole_write_site_customization sysconsole_read_site_public_links sysconsole_write_user_management_teams sysconsole_write_integrations_gif sysconsole_read_environment_image_proxy view_team sysconsole_read_reporting_team_statistics list_public_teams sysconsole_read_site_localization get_analytics sysconsole_read_authentication_password sysconsole_write_site_file_sharing_and_downloads create_elasticsearch_post_aggregation_job sysconsole_read_environment_elasticsearch recycle_database_connections sysconsole_write_environment_logging add_user_to_team sysconsole_read_user_management_groups sysconsole_write_integrations_integration_management manage_public_channel_properties join_private_teams convert_private_channel_to_public manage_team sysconsole_read_authentication_saml list_private_teams sysconsole_write_environment_performance_monitoring sysconsole_read_authentication_ldap sysconsole_read_plugins sysconsole_write_site_public_links read_elasticsearch_post_aggregation_job sysconsole_write_environment_session_lengths sysconsole_write_integrations_cors sysconsole_read_authentication_openid sysconsole_read_integrations_cors sysconsole_read_about_edition_and_license sysconsole_write_environment_image_proxy sysconsole_read_environment_database sysconsole_read_reporting_site_statistics remove_user_from_team sysconsole_write_integrations_bot_accounts sysconsole_write_environment_high_availability manage_private_channel_properties invalidate_caches sysconsole_read_authentication_mfa sysconsole_read_site_users_and_teams sysconsole_write_user_management_groups join_public_teams purge_elasticsearch_indexes delete_public_channel sysconsole_read_integrations_integration_management sysconsole_write_site_notifications test_s3 sysconsole_write_environment_developer sysconsole_read_environment_file_storage convert_public_channel_to_private sysconsole_read_site_customization sysconsole_write_environment_elasticsearch sysconsole_read_site_posts sysconsole_write_site_posts read_public_channel_groups	f	t
\.


--
-- Data for Name: schemes; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.schemes (id, name, displayname, description, createat, updateat, deleteat, scope, defaultteamadminrole, defaultteamuserrole, defaultchanneladminrole, defaultchanneluserrole, defaultteamguestrole, defaultchannelguestrole, defaultplaybookadminrole, defaultplaybookmemberrole, defaultrunadminrole, defaultrunmemberrole) FROM stdin;
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.sessions (id, token, createat, expiresat, lastactivityat, userid, deviceid, roles, isoauth, props, expirednotify) FROM stdin;
6qi5d5ra9iybtd3mb3dtc17cor	stadecs3qig5bmry341shqgyyr	1679987543554	1682579543554	1679987543554	fe4jgsubnidkirfqq8ym8i4ykw		system_admin system_user	f	{"os": "Linux", "csrf": "8r1hzix8fjygjbx8rai981nquc", "isSaml": "false", "browser": "Chrome/111.0", "isMobile": "false", "is_guest": "false", "platform": "Linux", "isOAuthUser": "false"}	f
\.


--
-- Data for Name: sharedchannelattachments; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.sharedchannelattachments (id, fileid, remoteid, createat, lastsyncat) FROM stdin;
\.


--
-- Data for Name: sharedchannelremotes; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.sharedchannelremotes (id, channelid, creatorid, createat, updateat, isinviteaccepted, isinviteconfirmed, remoteid, lastpostupdateat, lastpostid) FROM stdin;
\.


--
-- Data for Name: sharedchannels; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.sharedchannels (channelid, teamid, home, readonly, sharename, sharedisplayname, sharepurpose, shareheader, creatorid, createat, updateat, remoteid) FROM stdin;
\.


--
-- Data for Name: sharedchannelusers; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.sharedchannelusers (id, userid, remoteid, createat, lastsyncat, channelid) FROM stdin;
\.


--
-- Data for Name: sidebarcategories; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.sidebarcategories (id, userid, teamid, sortorder, sorting, type, displayname, muted, collapsed) FROM stdin;
\.


--
-- Data for Name: sidebarchannels; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.sidebarchannels (channelid, userid, categoryid, sortorder) FROM stdin;
\.


--
-- Data for Name: status; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.status (userid, status, manual, lastactivityat, dndendtime, prevstatus) FROM stdin;
\.


--
-- Data for Name: systems; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.systems (name, value) FROM stdin;
CRTChannelMembershipCountsMigrationComplete	true
CRTThreadCountsAndUnreadsMigrationComplete	true
DiagnosticId	q4wqd8883pg8pgedyu9q3x31yy
LastSecurityTime	1679987075582
FirstServerRunTimestamp	1679987075592
AdvancedPermissionsMigrationComplete	true
EmojisPermissionsMigrationComplete	true
GuestRolesCreationMigrationComplete	true
SystemConsoleRolesCreationMigrationComplete	true
emoji_permissions_split	true
webhook_permissions_split	true
list_join_public_private_teams	true
remove_permanent_delete_user	true
add_bot_permissions	true
apply_channel_manage_delete_to_channel_user	true
remove_channel_manage_delete_from_team_user	true
view_members_new_permission	true
add_manage_guests_permissions	true
channel_moderations_permissions	true
add_use_group_mentions_permission	true
add_system_console_permissions	true
add_convert_channel_permissions	true
manage_shared_channel_permissions	true
manage_secure_connections_permissions	true
add_system_roles_permissions	true
add_billing_permissions	true
download_compliance_export_results	true
experimental_subsection_permissions	true
authentication_subsection_permissions	true
integrations_subsection_permissions	true
site_subsection_permissions	true
compliance_subsection_permissions	true
environment_subsection_permissions	true
about_subsection_permissions	true
reporting_subsection_permissions	true
test_email_ancillary_permission	true
playbooks_permissions	true
custom_groups_permissions	true
playbooks_manage_roles	true
ContentExtractionConfigDefaultTrueMigrationComplete	true
PlaybookRolesCreationMigrationComplete	true
RemainingSchemaMigrations	true
AsymmetricSigningKey	{"ecdsa_key":{"curve":"P-256","x":86770576422923529779193372933614392975417590959194442766388169076800543148804,"y":9782565470263592665999025094678910708017345184496589638062605392809199195210,"d":12372930107167844876894275580728775768366781532777146938793541949911812084878}}
PostActionCookieSecret	{"key":"/N1asJ7GEPijcGlGcwG71RtvoZsD+C7tFyIGipRcfPA="}
InstallationDate	1679987083915
migration_advanced_permissions_phase_2	true
\.


--
-- Data for Name: teammembers; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.teammembers (teamid, userid, roles, deleteat, schemeuser, schemeadmin, schemeguest) FROM stdin;
\.


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.teams (id, createat, updateat, deleteat, displayname, name, description, email, type, companyname, alloweddomains, inviteid, schemeid, allowopeninvite, lastteamiconupdate, groupconstrained, cloudlimitsarchived) FROM stdin;
\.


--
-- Data for Name: termsofservice; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.termsofservice (id, createat, userid, text) FROM stdin;
\.


--
-- Data for Name: threadmemberships; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.threadmemberships (postid, userid, following, lastviewed, lastupdated, unreadmentions) FROM stdin;
\.


--
-- Data for Name: threads; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.threads (postid, replycount, lastreplyat, participants, channelid, threaddeleteat) FROM stdin;
\.


--
-- Data for Name: tokens; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.tokens (token, createat, type, extra) FROM stdin;
\.


--
-- Data for Name: uploadsessions; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.uploadsessions (id, type, createat, userid, channelid, filename, path, filesize, fileoffset, remoteid, reqfileid) FROM stdin;
\.


--
-- Data for Name: useraccesstokens; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.useraccesstokens (id, token, userid, description, isactive) FROM stdin;
\.


--
-- Data for Name: usergroups; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.usergroups (id, name, displayname, description, source, remoteid, createat, updateat, deleteat, allowreference) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.users (id, createat, updateat, deleteat, username, password, authdata, authservice, email, emailverified, nickname, firstname, lastname, roles, allowmarketing, props, notifyprops, lastpasswordupdate, lastpictureupdate, failedattempts, locale, mfaactive, mfasecret, "position", timezone, remoteid) FROM stdin;
h9ibc58bdi8sfpfoq8sqgdxxpr	1679987083915	1679987084096	0	feedbackbot		\N		feedbackbot@localhost	f		Feedbackbot		system_user	f	{}	{"push": "mention", "email": "true", "channel": "true", "desktop": "mention", "comments": "never", "first_name": "false", "push_status": "away", "mention_keys": "", "push_threads": "all", "desktop_sound": "true", "email_threads": "all", "desktop_threads": "all"}	1679987083915	1679987084096	0	en	f			{"manualTimezone": "", "automaticTimezone": "", "useAutomaticTimezone": "true"}	\N
z73x73z94tde3eu4r7qj8gc7rr	1679987084350	1679987084350	0	channelexport		\N		channelexport@localhost	f		Channel Export Bot		system_user	f	{}	{"push": "mention", "email": "true", "channel": "true", "desktop": "mention", "comments": "never", "first_name": "false", "push_status": "away", "mention_keys": "", "push_threads": "all", "desktop_sound": "true", "email_threads": "all", "desktop_threads": "all"}	1679987084350	0	0	en	f			{"manualTimezone": "", "automaticTimezone": "", "useAutomaticTimezone": "true"}	\N
erbyeb5k43rwmmfg4tk75qx5rc	1679987086365	1679987086566	0	appsbot		\N		appsbot@localhost	f		Mattermost Apps		system_user	f	{}	{"push": "mention", "email": "true", "channel": "true", "desktop": "mention", "comments": "never", "first_name": "false", "push_status": "away", "mention_keys": "", "push_threads": "all", "desktop_sound": "true", "email_threads": "all", "desktop_threads": "all"}	1679987086365	1679987086566	0	en	f			{"manualTimezone": "", "automaticTimezone": "", "useAutomaticTimezone": "true"}	\N
nwxzsy7jxfg6ibgkze6aoqdgpw	1679987087759	1679987087778	0	playbooks		\N		playbooks@localhost	f		Playbooks		system_user	f	{}	{"push": "mention", "email": "true", "channel": "true", "desktop": "mention", "comments": "never", "first_name": "false", "push_status": "away", "mention_keys": "", "push_threads": "all", "desktop_sound": "true", "email_threads": "all", "desktop_threads": "all"}	1679987087759	1679987087778	0	en	f			{"manualTimezone": "", "automaticTimezone": "", "useAutomaticTimezone": "true"}	\N
86b7ctpk1ign8qscr3fs7z13ty	1679987088484	1679987088484	0	boards		\N		boards@localhost	f		Boards		system_user	f	{}	{"push": "mention", "email": "true", "channel": "true", "desktop": "mention", "comments": "never", "first_name": "false", "push_status": "away", "mention_keys": "", "push_threads": "all", "desktop_sound": "true", "email_threads": "all", "desktop_threads": "all"}	1679987088484	0	0	en	f			{"manualTimezone": "", "automaticTimezone": "", "useAutomaticTimezone": "true"}	\N
fe4jgsubnidkirfqq8ym8i4ykw	1679987543317	1679987543852	0	kpas	$2a$10$YZJRntJeIbFVlyEGZKTSA.uSXNBm9KpIH1bLP5UCsR/3ujejLdcq6	\N		x@y.com	f				system_admin system_user	t	{}	{"push": "mention", "email": "true", "channel": "true", "desktop": "mention", "comments": "never", "first_name": "false", "push_status": "away", "mention_keys": "", "push_threads": "all", "desktop_sound": "true", "email_threads": "all", "desktop_threads": "all"}	1679987543317	0	0	en	f			{"manualTimezone": "", "automaticTimezone": "Europe/Zurich", "useAutomaticTimezone": "true"}	\N
\.


--
-- Data for Name: usertermsofservice; Type: TABLE DATA; Schema: public; Owner: mattermost
--

COPY public.usertermsofservice (userid, termsofserviceid, createat) FROM stdin;
\.


--
-- Name: audits audits_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.audits
    ADD CONSTRAINT audits_pkey PRIMARY KEY (id);


--
-- Name: bots bots_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.bots
    ADD CONSTRAINT bots_pkey PRIMARY KEY (userid);


--
-- Name: channelmemberhistory channelmemberhistory_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.channelmemberhistory
    ADD CONSTRAINT channelmemberhistory_pkey PRIMARY KEY (channelid, userid, jointime);


--
-- Name: channelmembers channelmembers_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.channelmembers
    ADD CONSTRAINT channelmembers_pkey PRIMARY KEY (channelid, userid);


--
-- Name: channels channels_name_teamid_key; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.channels
    ADD CONSTRAINT channels_name_teamid_key UNIQUE (name, teamid);


--
-- Name: channels channels_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.channels
    ADD CONSTRAINT channels_pkey PRIMARY KEY (id);


--
-- Name: clusterdiscovery clusterdiscovery_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.clusterdiscovery
    ADD CONSTRAINT clusterdiscovery_pkey PRIMARY KEY (id);


--
-- Name: commands commands_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.commands
    ADD CONSTRAINT commands_pkey PRIMARY KEY (id);


--
-- Name: commandwebhooks commandwebhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.commandwebhooks
    ADD CONSTRAINT commandwebhooks_pkey PRIMARY KEY (id);


--
-- Name: compliances compliances_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.compliances
    ADD CONSTRAINT compliances_pkey PRIMARY KEY (id);


--
-- Name: db_lock db_lock_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.db_lock
    ADD CONSTRAINT db_lock_pkey PRIMARY KEY (id);


--
-- Name: db_migrations db_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.db_migrations
    ADD CONSTRAINT db_migrations_pkey PRIMARY KEY (version);


--
-- Name: emoji emoji_name_deleteat_key; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.emoji
    ADD CONSTRAINT emoji_name_deleteat_key UNIQUE (name, deleteat);


--
-- Name: emoji emoji_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.emoji
    ADD CONSTRAINT emoji_pkey PRIMARY KEY (id);


--
-- Name: fileinfo fileinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.fileinfo
    ADD CONSTRAINT fileinfo_pkey PRIMARY KEY (id);


--
-- Name: focalboard_blocks_history focalboard_blocks_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.focalboard_blocks_history
    ADD CONSTRAINT focalboard_blocks_pkey PRIMARY KEY (id, insert_at);


--
-- Name: focalboard_blocks focalboard_blocks_pkey1; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.focalboard_blocks
    ADD CONSTRAINT focalboard_blocks_pkey1 PRIMARY KEY (workspace_id, id);


--
-- Name: focalboard_notification_hints focalboard_notification_hints_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.focalboard_notification_hints
    ADD CONSTRAINT focalboard_notification_hints_pkey PRIMARY KEY (block_id);


--
-- Name: focalboard_schema_migrations focalboard_schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.focalboard_schema_migrations
    ADD CONSTRAINT focalboard_schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: focalboard_sessions focalboard_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.focalboard_sessions
    ADD CONSTRAINT focalboard_sessions_pkey PRIMARY KEY (id);


--
-- Name: focalboard_sharing focalboard_sharing_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.focalboard_sharing
    ADD CONSTRAINT focalboard_sharing_pkey PRIMARY KEY (id);


--
-- Name: focalboard_subscriptions focalboard_subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.focalboard_subscriptions
    ADD CONSTRAINT focalboard_subscriptions_pkey PRIMARY KEY (block_id, subscriber_id);


--
-- Name: focalboard_system_settings focalboard_system_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.focalboard_system_settings
    ADD CONSTRAINT focalboard_system_settings_pkey PRIMARY KEY (id);


--
-- Name: focalboard_users focalboard_users_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.focalboard_users
    ADD CONSTRAINT focalboard_users_pkey PRIMARY KEY (id);


--
-- Name: focalboard_workspaces focalboard_workspaces_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.focalboard_workspaces
    ADD CONSTRAINT focalboard_workspaces_pkey PRIMARY KEY (id);


--
-- Name: groupchannels groupchannels_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.groupchannels
    ADD CONSTRAINT groupchannels_pkey PRIMARY KEY (groupid, channelid);


--
-- Name: groupmembers groupmembers_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.groupmembers
    ADD CONSTRAINT groupmembers_pkey PRIMARY KEY (groupid, userid);


--
-- Name: groupteams groupteams_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.groupteams
    ADD CONSTRAINT groupteams_pkey PRIMARY KEY (groupid, teamid);


--
-- Name: incomingwebhooks incomingwebhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.incomingwebhooks
    ADD CONSTRAINT incomingwebhooks_pkey PRIMARY KEY (id);


--
-- Name: ir_channelaction ir_channelaction_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.ir_channelaction
    ADD CONSTRAINT ir_channelaction_pkey PRIMARY KEY (id);


--
-- Name: ir_db_migrations ir_db_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.ir_db_migrations
    ADD CONSTRAINT ir_db_migrations_pkey PRIMARY KEY (version);


--
-- Name: ir_incident ir_incident_channelid_key; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.ir_incident
    ADD CONSTRAINT ir_incident_channelid_key UNIQUE (channelid);


--
-- Name: ir_incident ir_incident_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.ir_incident
    ADD CONSTRAINT ir_incident_pkey PRIMARY KEY (id);


--
-- Name: ir_metric ir_metric_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.ir_metric
    ADD CONSTRAINT ir_metric_pkey PRIMARY KEY (incidentid, metricconfigid);


--
-- Name: ir_metricconfig ir_metricconfig_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.ir_metricconfig
    ADD CONSTRAINT ir_metricconfig_pkey PRIMARY KEY (id);


--
-- Name: ir_playbook ir_playbook_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.ir_playbook
    ADD CONSTRAINT ir_playbook_pkey PRIMARY KEY (id);


--
-- Name: ir_playbookautofollow ir_playbookautofollow_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.ir_playbookautofollow
    ADD CONSTRAINT ir_playbookautofollow_pkey PRIMARY KEY (playbookid, userid);


--
-- Name: ir_playbookmember ir_playbookmember_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.ir_playbookmember
    ADD CONSTRAINT ir_playbookmember_pkey PRIMARY KEY (memberid, playbookid);


--
-- Name: ir_playbookmember ir_playbookmember_playbookid_memberid_key; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.ir_playbookmember
    ADD CONSTRAINT ir_playbookmember_playbookid_memberid_key UNIQUE (playbookid, memberid);


--
-- Name: ir_run_participants ir_run_participants_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.ir_run_participants
    ADD CONSTRAINT ir_run_participants_pkey PRIMARY KEY (incidentid, userid);


--
-- Name: ir_statusposts ir_statusposts_incidentid_postid_key; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.ir_statusposts
    ADD CONSTRAINT ir_statusposts_incidentid_postid_key UNIQUE (incidentid, postid);


--
-- Name: ir_statusposts ir_statusposts_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.ir_statusposts
    ADD CONSTRAINT ir_statusposts_pkey PRIMARY KEY (incidentid, postid);


--
-- Name: ir_system ir_system_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.ir_system
    ADD CONSTRAINT ir_system_pkey PRIMARY KEY (skey);


--
-- Name: ir_timelineevent ir_timelineevent_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.ir_timelineevent
    ADD CONSTRAINT ir_timelineevent_pkey PRIMARY KEY (id);


--
-- Name: ir_userinfo ir_userinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.ir_userinfo
    ADD CONSTRAINT ir_userinfo_pkey PRIMARY KEY (id);


--
-- Name: ir_viewedchannel ir_viewedchannel_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.ir_viewedchannel
    ADD CONSTRAINT ir_viewedchannel_pkey PRIMARY KEY (channelid, userid);


--
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- Name: licenses licenses_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.licenses
    ADD CONSTRAINT licenses_pkey PRIMARY KEY (id);


--
-- Name: linkmetadata linkmetadata_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.linkmetadata
    ADD CONSTRAINT linkmetadata_pkey PRIMARY KEY (hash);


--
-- Name: oauthaccessdata oauthaccessdata_clientid_userid_key; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.oauthaccessdata
    ADD CONSTRAINT oauthaccessdata_clientid_userid_key UNIQUE (clientid, userid);


--
-- Name: oauthaccessdata oauthaccessdata_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.oauthaccessdata
    ADD CONSTRAINT oauthaccessdata_pkey PRIMARY KEY (token);


--
-- Name: oauthapps oauthapps_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.oauthapps
    ADD CONSTRAINT oauthapps_pkey PRIMARY KEY (id);


--
-- Name: oauthauthdata oauthauthdata_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.oauthauthdata
    ADD CONSTRAINT oauthauthdata_pkey PRIMARY KEY (code);


--
-- Name: outgoingwebhooks outgoingwebhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.outgoingwebhooks
    ADD CONSTRAINT outgoingwebhooks_pkey PRIMARY KEY (id);


--
-- Name: pluginkeyvaluestore pluginkeyvaluestore_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.pluginkeyvaluestore
    ADD CONSTRAINT pluginkeyvaluestore_pkey PRIMARY KEY (pluginid, pkey);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: preferences preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.preferences
    ADD CONSTRAINT preferences_pkey PRIMARY KEY (userid, category, name);


--
-- Name: productnoticeviewstate productnoticeviewstate_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.productnoticeviewstate
    ADD CONSTRAINT productnoticeviewstate_pkey PRIMARY KEY (userid, noticeid);


--
-- Name: publicchannels publicchannels_name_teamid_key; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.publicchannels
    ADD CONSTRAINT publicchannels_name_teamid_key UNIQUE (name, teamid);


--
-- Name: publicchannels publicchannels_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.publicchannels
    ADD CONSTRAINT publicchannels_pkey PRIMARY KEY (id);


--
-- Name: reactions reactions_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.reactions
    ADD CONSTRAINT reactions_pkey PRIMARY KEY (postid, userid, emojiname);


--
-- Name: recentsearches recentsearches_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.recentsearches
    ADD CONSTRAINT recentsearches_pkey PRIMARY KEY (userid, searchpointer);


--
-- Name: remoteclusters remoteclusters_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.remoteclusters
    ADD CONSTRAINT remoteclusters_pkey PRIMARY KEY (remoteid, name);


--
-- Name: retentionpolicies retentionpolicies_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.retentionpolicies
    ADD CONSTRAINT retentionpolicies_pkey PRIMARY KEY (id);


--
-- Name: retentionpolicieschannels retentionpolicieschannels_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.retentionpolicieschannels
    ADD CONSTRAINT retentionpolicieschannels_pkey PRIMARY KEY (channelid);


--
-- Name: retentionpoliciesteams retentionpoliciesteams_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.retentionpoliciesteams
    ADD CONSTRAINT retentionpoliciesteams_pkey PRIMARY KEY (teamid);


--
-- Name: roles roles_name_key; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key UNIQUE (name);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: schemes schemes_name_key; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.schemes
    ADD CONSTRAINT schemes_name_key UNIQUE (name);


--
-- Name: schemes schemes_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.schemes
    ADD CONSTRAINT schemes_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sharedchannelattachments sharedchannelattachments_fileid_remoteid_key; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.sharedchannelattachments
    ADD CONSTRAINT sharedchannelattachments_fileid_remoteid_key UNIQUE (fileid, remoteid);


--
-- Name: sharedchannelattachments sharedchannelattachments_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.sharedchannelattachments
    ADD CONSTRAINT sharedchannelattachments_pkey PRIMARY KEY (id);


--
-- Name: sharedchannelremotes sharedchannelremotes_channelid_remoteid_key; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.sharedchannelremotes
    ADD CONSTRAINT sharedchannelremotes_channelid_remoteid_key UNIQUE (channelid, remoteid);


--
-- Name: sharedchannelremotes sharedchannelremotes_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.sharedchannelremotes
    ADD CONSTRAINT sharedchannelremotes_pkey PRIMARY KEY (id, channelid);


--
-- Name: sharedchannels sharedchannels_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.sharedchannels
    ADD CONSTRAINT sharedchannels_pkey PRIMARY KEY (channelid);


--
-- Name: sharedchannels sharedchannels_sharename_teamid_key; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.sharedchannels
    ADD CONSTRAINT sharedchannels_sharename_teamid_key UNIQUE (sharename, teamid);


--
-- Name: sharedchannelusers sharedchannelusers_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.sharedchannelusers
    ADD CONSTRAINT sharedchannelusers_pkey PRIMARY KEY (id);


--
-- Name: sharedchannelusers sharedchannelusers_userid_channelid_remoteid_key; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.sharedchannelusers
    ADD CONSTRAINT sharedchannelusers_userid_channelid_remoteid_key UNIQUE (userid, channelid, remoteid);


--
-- Name: sidebarcategories sidebarcategories_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.sidebarcategories
    ADD CONSTRAINT sidebarcategories_pkey PRIMARY KEY (id);


--
-- Name: sidebarchannels sidebarchannels_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.sidebarchannels
    ADD CONSTRAINT sidebarchannels_pkey PRIMARY KEY (channelid, userid, categoryid);


--
-- Name: status status_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.status
    ADD CONSTRAINT status_pkey PRIMARY KEY (userid);


--
-- Name: systems systems_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.systems
    ADD CONSTRAINT systems_pkey PRIMARY KEY (name);


--
-- Name: teammembers teammembers_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.teammembers
    ADD CONSTRAINT teammembers_pkey PRIMARY KEY (teamid, userid);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (id);


--
-- Name: termsofservice termsofservice_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.termsofservice
    ADD CONSTRAINT termsofservice_pkey PRIMARY KEY (id);


--
-- Name: threadmemberships threadmemberships_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.threadmemberships
    ADD CONSTRAINT threadmemberships_pkey PRIMARY KEY (postid, userid);


--
-- Name: threads threads_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.threads
    ADD CONSTRAINT threads_pkey PRIMARY KEY (postid);


--
-- Name: tokens tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT tokens_pkey PRIMARY KEY (token);


--
-- Name: uploadsessions uploadsessions_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.uploadsessions
    ADD CONSTRAINT uploadsessions_pkey PRIMARY KEY (id);


--
-- Name: useraccesstokens useraccesstokens_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.useraccesstokens
    ADD CONSTRAINT useraccesstokens_pkey PRIMARY KEY (id);


--
-- Name: useraccesstokens useraccesstokens_token_key; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.useraccesstokens
    ADD CONSTRAINT useraccesstokens_token_key UNIQUE (token);


--
-- Name: usergroups usergroups_name_key; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.usergroups
    ADD CONSTRAINT usergroups_name_key UNIQUE (name);


--
-- Name: usergroups usergroups_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.usergroups
    ADD CONSTRAINT usergroups_pkey PRIMARY KEY (id);


--
-- Name: usergroups usergroups_source_remoteid_key; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.usergroups
    ADD CONSTRAINT usergroups_source_remoteid_key UNIQUE (source, remoteid);


--
-- Name: users users_authdata_key; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_authdata_key UNIQUE (authdata);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: usertermsofservice usertermsofservice_pkey; Type: CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.usertermsofservice
    ADD CONSTRAINT usertermsofservice_pkey PRIMARY KEY (userid);


--
-- Name: idx_audits_user_id; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_audits_user_id ON public.audits USING btree (userid);


--
-- Name: idx_channel_search_txt; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_channel_search_txt ON public.channels USING gin (to_tsvector('english'::regconfig, (((((name)::text || ' '::text) || (displayname)::text) || ' '::text) || (purpose)::text)));


--
-- Name: idx_channelmembers_channel_id_scheme_guest_user_id; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_channelmembers_channel_id_scheme_guest_user_id ON public.channelmembers USING btree (channelid, schemeguest, userid);


--
-- Name: idx_channelmembers_user_id_channel_id_last_viewed_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_channelmembers_user_id_channel_id_last_viewed_at ON public.channelmembers USING btree (userid, channelid, lastviewedat);


--
-- Name: idx_channels_create_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_channels_create_at ON public.channels USING btree (createat);


--
-- Name: idx_channels_delete_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_channels_delete_at ON public.channels USING btree (deleteat);


--
-- Name: idx_channels_displayname_lower; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_channels_displayname_lower ON public.channels USING btree (lower((displayname)::text));


--
-- Name: idx_channels_name_lower; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_channels_name_lower ON public.channels USING btree (lower((name)::text));


--
-- Name: idx_channels_scheme_id; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_channels_scheme_id ON public.channels USING btree (schemeid);


--
-- Name: idx_channels_team_id_display_name; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_channels_team_id_display_name ON public.channels USING btree (teamid, displayname);


--
-- Name: idx_channels_team_id_type; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_channels_team_id_type ON public.channels USING btree (teamid, type);


--
-- Name: idx_channels_update_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_channels_update_at ON public.channels USING btree (updateat);


--
-- Name: idx_command_create_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_command_create_at ON public.commands USING btree (createat);


--
-- Name: idx_command_delete_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_command_delete_at ON public.commands USING btree (deleteat);


--
-- Name: idx_command_team_id; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_command_team_id ON public.commands USING btree (teamid);


--
-- Name: idx_command_update_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_command_update_at ON public.commands USING btree (updateat);


--
-- Name: idx_command_webhook_create_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_command_webhook_create_at ON public.commandwebhooks USING btree (createat);


--
-- Name: idx_emoji_create_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_emoji_create_at ON public.emoji USING btree (createat);


--
-- Name: idx_emoji_delete_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_emoji_delete_at ON public.emoji USING btree (deleteat);


--
-- Name: idx_emoji_update_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_emoji_update_at ON public.emoji USING btree (updateat);


--
-- Name: idx_fileinfo_content_txt; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_fileinfo_content_txt ON public.fileinfo USING gin (to_tsvector('english'::regconfig, content));


--
-- Name: idx_fileinfo_create_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_fileinfo_create_at ON public.fileinfo USING btree (createat);


--
-- Name: idx_fileinfo_delete_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_fileinfo_delete_at ON public.fileinfo USING btree (deleteat);


--
-- Name: idx_fileinfo_extension_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_fileinfo_extension_at ON public.fileinfo USING btree (extension);


--
-- Name: idx_fileinfo_name_splitted; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_fileinfo_name_splitted ON public.fileinfo USING gin (to_tsvector('english'::regconfig, translate((name)::text, '.,-'::text, '   '::text)));


--
-- Name: idx_fileinfo_name_txt; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_fileinfo_name_txt ON public.fileinfo USING gin (to_tsvector('english'::regconfig, (name)::text));


--
-- Name: idx_fileinfo_postid_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_fileinfo_postid_at ON public.fileinfo USING btree (postid);


--
-- Name: idx_fileinfo_update_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_fileinfo_update_at ON public.fileinfo USING btree (updateat);


--
-- Name: idx_groupchannels_channelid; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_groupchannels_channelid ON public.groupchannels USING btree (channelid);


--
-- Name: idx_groupchannels_schemeadmin; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_groupchannels_schemeadmin ON public.groupchannels USING btree (schemeadmin);


--
-- Name: idx_groupmembers_create_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_groupmembers_create_at ON public.groupmembers USING btree (createat);


--
-- Name: idx_groupteams_schemeadmin; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_groupteams_schemeadmin ON public.groupteams USING btree (schemeadmin);


--
-- Name: idx_groupteams_teamid; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_groupteams_teamid ON public.groupteams USING btree (teamid);


--
-- Name: idx_incoming_webhook_create_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_incoming_webhook_create_at ON public.incomingwebhooks USING btree (createat);


--
-- Name: idx_incoming_webhook_delete_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_incoming_webhook_delete_at ON public.incomingwebhooks USING btree (deleteat);


--
-- Name: idx_incoming_webhook_team_id; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_incoming_webhook_team_id ON public.incomingwebhooks USING btree (teamid);


--
-- Name: idx_incoming_webhook_update_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_incoming_webhook_update_at ON public.incomingwebhooks USING btree (updateat);


--
-- Name: idx_incoming_webhook_user_id; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_incoming_webhook_user_id ON public.incomingwebhooks USING btree (userid);


--
-- Name: idx_jobs_status_type; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_jobs_status_type ON public.jobs USING btree (status, type);


--
-- Name: idx_jobs_type; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_jobs_type ON public.jobs USING btree (type);


--
-- Name: idx_link_metadata_url_timestamp; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_link_metadata_url_timestamp ON public.linkmetadata USING btree (url, "timestamp");


--
-- Name: idx_notice_views_notice_id; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_notice_views_notice_id ON public.productnoticeviewstate USING btree (noticeid);


--
-- Name: idx_notice_views_timestamp; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_notice_views_timestamp ON public.productnoticeviewstate USING btree ("timestamp");


--
-- Name: idx_oauthaccessdata_refresh_token; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_oauthaccessdata_refresh_token ON public.oauthaccessdata USING btree (refreshtoken);


--
-- Name: idx_oauthaccessdata_user_id; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_oauthaccessdata_user_id ON public.oauthaccessdata USING btree (userid);


--
-- Name: idx_oauthapps_creator_id; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_oauthapps_creator_id ON public.oauthapps USING btree (creatorid);


--
-- Name: idx_outgoing_webhook_create_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_outgoing_webhook_create_at ON public.outgoingwebhooks USING btree (createat);


--
-- Name: idx_outgoing_webhook_delete_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_outgoing_webhook_delete_at ON public.outgoingwebhooks USING btree (deleteat);


--
-- Name: idx_outgoing_webhook_team_id; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_outgoing_webhook_team_id ON public.outgoingwebhooks USING btree (teamid);


--
-- Name: idx_outgoing_webhook_update_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_outgoing_webhook_update_at ON public.outgoingwebhooks USING btree (updateat);


--
-- Name: idx_posts_channel_id_delete_at_create_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_posts_channel_id_delete_at_create_at ON public.posts USING btree (channelid, deleteat, createat);


--
-- Name: idx_posts_channel_id_update_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_posts_channel_id_update_at ON public.posts USING btree (channelid, updateat);


--
-- Name: idx_posts_create_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_posts_create_at ON public.posts USING btree (createat);


--
-- Name: idx_posts_create_at_id; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_posts_create_at_id ON public.posts USING btree (createat, id);


--
-- Name: idx_posts_delete_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_posts_delete_at ON public.posts USING btree (deleteat);


--
-- Name: idx_posts_hashtags_txt; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_posts_hashtags_txt ON public.posts USING gin (to_tsvector('english'::regconfig, (hashtags)::text));


--
-- Name: idx_posts_is_pinned; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_posts_is_pinned ON public.posts USING btree (ispinned);


--
-- Name: idx_posts_message_txt; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_posts_message_txt ON public.posts USING gin (to_tsvector('english'::regconfig, (message)::text));


--
-- Name: idx_posts_root_id_delete_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_posts_root_id_delete_at ON public.posts USING btree (rootid, deleteat);


--
-- Name: idx_posts_update_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_posts_update_at ON public.posts USING btree (updateat);


--
-- Name: idx_posts_user_id; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_posts_user_id ON public.posts USING btree (userid);


--
-- Name: idx_preferences_category; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_preferences_category ON public.preferences USING btree (category);


--
-- Name: idx_preferences_name; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_preferences_name ON public.preferences USING btree (name);


--
-- Name: idx_publicchannels_delete_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_publicchannels_delete_at ON public.publicchannels USING btree (deleteat);


--
-- Name: idx_publicchannels_displayname_lower; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_publicchannels_displayname_lower ON public.publicchannels USING btree (lower((displayname)::text));


--
-- Name: idx_publicchannels_name_lower; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_publicchannels_name_lower ON public.publicchannels USING btree (lower((name)::text));


--
-- Name: idx_publicchannels_search_txt; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_publicchannels_search_txt ON public.publicchannels USING gin (to_tsvector('english'::regconfig, (((((name)::text || ' '::text) || (displayname)::text) || ' '::text) || (purpose)::text)));


--
-- Name: idx_publicchannels_team_id; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_publicchannels_team_id ON public.publicchannels USING btree (teamid);


--
-- Name: idx_reactions_channel_id; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_reactions_channel_id ON public.reactions USING btree (channelid);


--
-- Name: idx_retentionpolicies_displayname; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_retentionpolicies_displayname ON public.retentionpolicies USING btree (displayname);


--
-- Name: idx_retentionpolicieschannels_policyid; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_retentionpolicieschannels_policyid ON public.retentionpolicieschannels USING btree (policyid);


--
-- Name: idx_retentionpoliciesteams_policyid; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_retentionpoliciesteams_policyid ON public.retentionpoliciesteams USING btree (policyid);


--
-- Name: idx_schemes_channel_admin_role; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_schemes_channel_admin_role ON public.schemes USING btree (defaultchanneladminrole);


--
-- Name: idx_schemes_channel_guest_role; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_schemes_channel_guest_role ON public.schemes USING btree (defaultchannelguestrole);


--
-- Name: idx_schemes_channel_user_role; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_schemes_channel_user_role ON public.schemes USING btree (defaultchanneluserrole);


--
-- Name: idx_sessions_create_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_sessions_create_at ON public.sessions USING btree (createat);


--
-- Name: idx_sessions_expires_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_sessions_expires_at ON public.sessions USING btree (expiresat);


--
-- Name: idx_sessions_last_activity_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_sessions_last_activity_at ON public.sessions USING btree (lastactivityat);


--
-- Name: idx_sessions_token; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_sessions_token ON public.sessions USING btree (token);


--
-- Name: idx_sessions_user_id; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_sessions_user_id ON public.sessions USING btree (userid);


--
-- Name: idx_sharedchannelusers_remote_id; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_sharedchannelusers_remote_id ON public.sharedchannelusers USING btree (remoteid);


--
-- Name: idx_sidebarcategories_userid_teamid; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_sidebarcategories_userid_teamid ON public.sidebarcategories USING btree (userid, teamid);


--
-- Name: idx_status_status_dndendtime; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_status_status_dndendtime ON public.status USING btree (status, dndendtime);


--
-- Name: idx_teammembers_delete_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_teammembers_delete_at ON public.teammembers USING btree (deleteat);


--
-- Name: idx_teammembers_user_id; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_teammembers_user_id ON public.teammembers USING btree (userid);


--
-- Name: idx_teams_create_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_teams_create_at ON public.teams USING btree (createat);


--
-- Name: idx_teams_delete_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_teams_delete_at ON public.teams USING btree (deleteat);


--
-- Name: idx_teams_invite_id; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_teams_invite_id ON public.teams USING btree (inviteid);


--
-- Name: idx_teams_scheme_id; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_teams_scheme_id ON public.teams USING btree (schemeid);


--
-- Name: idx_teams_update_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_teams_update_at ON public.teams USING btree (updateat);


--
-- Name: idx_thread_memberships_last_update_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_thread_memberships_last_update_at ON public.threadmemberships USING btree (lastupdated);


--
-- Name: idx_thread_memberships_last_view_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_thread_memberships_last_view_at ON public.threadmemberships USING btree (lastviewed);


--
-- Name: idx_thread_memberships_user_id; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_thread_memberships_user_id ON public.threadmemberships USING btree (userid);


--
-- Name: idx_threads_channel_id_last_reply_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_threads_channel_id_last_reply_at ON public.threads USING btree (channelid, lastreplyat);


--
-- Name: idx_uploadsessions_create_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_uploadsessions_create_at ON public.uploadsessions USING btree (createat);


--
-- Name: idx_uploadsessions_type; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_uploadsessions_type ON public.uploadsessions USING btree (type);


--
-- Name: idx_uploadsessions_user_id; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_uploadsessions_user_id ON public.uploadsessions USING btree (userid);


--
-- Name: idx_user_access_tokens_user_id; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_user_access_tokens_user_id ON public.useraccesstokens USING btree (userid);


--
-- Name: idx_usergroups_delete_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_usergroups_delete_at ON public.usergroups USING btree (deleteat);


--
-- Name: idx_usergroups_displayname; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_usergroups_displayname ON public.usergroups USING btree (displayname);


--
-- Name: idx_usergroups_remote_id; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_usergroups_remote_id ON public.usergroups USING btree (remoteid);


--
-- Name: idx_users_all_no_full_name_txt; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_users_all_no_full_name_txt ON public.users USING gin (to_tsvector('english'::regconfig, (((((username)::text || ' '::text) || (nickname)::text) || ' '::text) || (email)::text)));


--
-- Name: idx_users_all_txt; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_users_all_txt ON public.users USING gin (to_tsvector('english'::regconfig, (((((((((username)::text || ' '::text) || (firstname)::text) || ' '::text) || (lastname)::text) || ' '::text) || (nickname)::text) || ' '::text) || (email)::text)));


--
-- Name: idx_users_create_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_users_create_at ON public.users USING btree (createat);


--
-- Name: idx_users_delete_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_users_delete_at ON public.users USING btree (deleteat);


--
-- Name: idx_users_email_lower_textpattern; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_users_email_lower_textpattern ON public.users USING btree (lower((email)::text) text_pattern_ops);


--
-- Name: idx_users_firstname_lower_textpattern; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_users_firstname_lower_textpattern ON public.users USING btree (lower((firstname)::text) text_pattern_ops);


--
-- Name: idx_users_lastname_lower_textpattern; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_users_lastname_lower_textpattern ON public.users USING btree (lower((lastname)::text) text_pattern_ops);


--
-- Name: idx_users_names_no_full_name_txt; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_users_names_no_full_name_txt ON public.users USING gin (to_tsvector('english'::regconfig, (((username)::text || ' '::text) || (nickname)::text)));


--
-- Name: idx_users_names_txt; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_users_names_txt ON public.users USING gin (to_tsvector('english'::regconfig, (((((((username)::text || ' '::text) || (firstname)::text) || ' '::text) || (lastname)::text) || ' '::text) || (nickname)::text)));


--
-- Name: idx_users_nickname_lower_textpattern; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_users_nickname_lower_textpattern ON public.users USING btree (lower((nickname)::text) text_pattern_ops);


--
-- Name: idx_users_update_at; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_users_update_at ON public.users USING btree (updateat);


--
-- Name: idx_users_username_lower_textpattern; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX idx_users_username_lower_textpattern ON public.users USING btree (lower((username)::text) text_pattern_ops);


--
-- Name: ir_channelaction_channelid; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX ir_channelaction_channelid ON public.ir_channelaction USING btree (channelid);


--
-- Name: ir_incident_channelid; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX ir_incident_channelid ON public.ir_incident USING btree (channelid);


--
-- Name: ir_incident_teamid; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX ir_incident_teamid ON public.ir_incident USING btree (teamid);


--
-- Name: ir_incident_teamid_commanderuserid; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX ir_incident_teamid_commanderuserid ON public.ir_incident USING btree (teamid, commanderuserid);


--
-- Name: ir_metric_incidentid; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX ir_metric_incidentid ON public.ir_metric USING btree (incidentid);


--
-- Name: ir_metric_metricconfigid; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX ir_metric_metricconfigid ON public.ir_metric USING btree (metricconfigid);


--
-- Name: ir_metricconfig_playbookid; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX ir_metricconfig_playbookid ON public.ir_metricconfig USING btree (playbookid);


--
-- Name: ir_playbook_teamid; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX ir_playbook_teamid ON public.ir_playbook USING btree (teamid);


--
-- Name: ir_playbook_updateat; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX ir_playbook_updateat ON public.ir_playbook USING btree (updateat);


--
-- Name: ir_playbookmember_memberid; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX ir_playbookmember_memberid ON public.ir_playbookmember USING btree (memberid);


--
-- Name: ir_playbookmember_playbookid; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX ir_playbookmember_playbookid ON public.ir_playbookmember USING btree (playbookid);


--
-- Name: ir_run_participants_incidentid; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX ir_run_participants_incidentid ON public.ir_run_participants USING btree (incidentid);


--
-- Name: ir_run_participants_userid; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX ir_run_participants_userid ON public.ir_run_participants USING btree (userid);


--
-- Name: ir_statusposts_incidentid; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX ir_statusposts_incidentid ON public.ir_statusposts USING btree (incidentid);


--
-- Name: ir_statusposts_postid; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX ir_statusposts_postid ON public.ir_statusposts USING btree (postid);


--
-- Name: ir_timelineevent_id; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX ir_timelineevent_id ON public.ir_timelineevent USING btree (id);


--
-- Name: ir_timelineevent_incidentid; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE INDEX ir_timelineevent_incidentid ON public.ir_timelineevent USING btree (incidentid);


--
-- Name: remote_clusters_site_url_unique; Type: INDEX; Schema: public; Owner: mattermost
--

CREATE UNIQUE INDEX remote_clusters_site_url_unique ON public.remoteclusters USING btree (siteurl, remoteteamid);


--
-- Name: retentionpolicieschannels fk_retentionpolicieschannels_retentionpolicies; Type: FK CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.retentionpolicieschannels
    ADD CONSTRAINT fk_retentionpolicieschannels_retentionpolicies FOREIGN KEY (policyid) REFERENCES public.retentionpolicies(id) ON DELETE CASCADE;


--
-- Name: retentionpoliciesteams fk_retentionpoliciesteams_retentionpolicies; Type: FK CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.retentionpoliciesteams
    ADD CONSTRAINT fk_retentionpoliciesteams_retentionpolicies FOREIGN KEY (policyid) REFERENCES public.retentionpolicies(id) ON DELETE CASCADE;


--
-- Name: ir_metric ir_metric_incidentid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.ir_metric
    ADD CONSTRAINT ir_metric_incidentid_fkey FOREIGN KEY (incidentid) REFERENCES public.ir_incident(id);


--
-- Name: ir_metric ir_metric_metricconfigid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.ir_metric
    ADD CONSTRAINT ir_metric_metricconfigid_fkey FOREIGN KEY (metricconfigid) REFERENCES public.ir_metricconfig(id);


--
-- Name: ir_metricconfig ir_metricconfig_playbookid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.ir_metricconfig
    ADD CONSTRAINT ir_metricconfig_playbookid_fkey FOREIGN KEY (playbookid) REFERENCES public.ir_playbook(id);


--
-- Name: ir_playbookautofollow ir_playbookautofollow_playbookid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.ir_playbookautofollow
    ADD CONSTRAINT ir_playbookautofollow_playbookid_fkey FOREIGN KEY (playbookid) REFERENCES public.ir_playbook(id);


--
-- Name: ir_playbookmember ir_playbookmember_playbookid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.ir_playbookmember
    ADD CONSTRAINT ir_playbookmember_playbookid_fkey FOREIGN KEY (playbookid) REFERENCES public.ir_playbook(id);


--
-- Name: ir_run_participants ir_run_participants_incidentid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.ir_run_participants
    ADD CONSTRAINT ir_run_participants_incidentid_fkey FOREIGN KEY (incidentid) REFERENCES public.ir_incident(id);


--
-- Name: ir_statusposts ir_statusposts_incidentid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.ir_statusposts
    ADD CONSTRAINT ir_statusposts_incidentid_fkey FOREIGN KEY (incidentid) REFERENCES public.ir_incident(id);


--
-- Name: ir_timelineevent ir_timelineevent_incidentid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mattermost
--

ALTER TABLE ONLY public.ir_timelineevent
    ADD CONSTRAINT ir_timelineevent_incidentid_fkey FOREIGN KEY (incidentid) REFERENCES public.ir_incident(id);


--
-- PostgreSQL database dump complete
--

